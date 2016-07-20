//
//  ViewController.swift
//  FakeDBFM
//
//  Created by HuanGong on 16/7/10.
//  Copyright © 2016年 HuanGong. All rights reserved.
//

import UIKit
import MediaPlayer
import AVFoundation
import AVKit

import QuartzCore


class ViewController: UIViewController,
                      UITableViewDelegate,
                      UITableViewDataSource,
                      HttpProtocol,
                      channelprotocol {

    @IBOutlet var tapRecognizer: UITapGestureRecognizer!
    @IBOutlet weak var playBtn: UIImageView!
    @IBOutlet weak var tv: UITableView!
    @IBOutlet weak var iv: UIImageView!
    @IBOutlet weak var playtime: UILabel!
    @IBOutlet weak var progressview: UIProgressView!

    var http: HttpController = HttpController()
    var audioplayer: AVPlayer! = nil
    
    
    var musiclist:NSArray = NSArray()
    var channellist = NSArray()
    var imageCache = Dictionary<String,UIImage>()
    
    var timer:NSTimer?
    
    @IBAction func onTapRecognized(sender: AnyObject) {
        print("hello tab recognized")
        if sender.view == playBtn {
            playBtn.hidden = true;
            audioplayer.play();
            playBtn.removeGestureRecognizer(tapRecognizer)
            iv.addGestureRecognizer(tapRecognizer)
        } else if (sender.view == iv) {
            playBtn.hidden = false;
            audioplayer.pause()
            iv.removeGestureRecognizer(tapRecognizer)
            playBtn.addGestureRecognizer(tapRecognizer)
        }
        //if (sender)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        audioplayer = AVPlayer();
        audioplayer.volume = 0.1;
        
        http.delegate = self
        http.onSearch("http://www.douban.com/j/app/radio/channels")
        http.onSearch("http://douban.fm/j/mine/playlist?channel=0")
        iv.addGestureRecognizer(tapRecognizer)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    //@
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return musiclist.count;
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let channelViewController:ChanelController = segue.destinationViewController as! ChanelController
        channelViewController.channel_delegate = self
        channelViewController.channelData = self.channellist
    }
    
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "musiclist")
        let rowdata:NSDictionary = self.musiclist[indexPath.row] as! NSDictionary
        
        cell.textLabel?.text = rowdata["title"] as? String
        cell.detailTextLabel?.text = rowdata["artist"] as? String
        let postimgurl = rowdata["picture"] as! String
        let image:UIImage? = self.imageCache[postimgurl]
        if (image == nil) {// url request the image data
            let imgurl:NSURL = NSURL(string: postimgurl)!
            let request: NSURLRequest = NSURLRequest(URL: imgurl)
            let urlSession = NSURLSession.sharedSession()
            let datatask = urlSession.dataTaskWithRequest(request, completionHandler: {
                (data: NSData?, response: NSURLResponse?, error:NSError?)->Void in
                if (error != nil) {
                    print("url request load data error", error?.description)
                } else if data != nil {
                    let img = UIImage(data: (data)!)
                    cell.imageView?.image = img
                    self.imageCache[postimgurl] = img
                }
            })
            datatask.resume()
        } else {
            cell.imageView?.image = image //UIImage(named: "detail.jpg")
        }
        return cell;
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //self.dismissViewControllerAnimated(true, completion: nil)
        
        let songInfo:NSDictionary = self.musiclist[indexPath.row] as! NSDictionary
        let songUrl:String? = songInfo["url"] as? String
        self.onPlayNewItem(songUrl!)
        let postImgUrl:String? = songInfo["picture"] as? String
        self.onSetMusicPostImage(postImgUrl!)
    }
    
    func didRecieveResults(results: NSDictionary) -> Void {
        print("===============================\n")
        print(results)
        
        if ((results["song"]) != nil) {
            self.musiclist = results["song"] as! NSArray
            self.tv.reloadData()
            //play the music
            let songInfo:NSDictionary = self.musiclist[0] as! NSDictionary
            let songUrl:String? = songInfo["url"] as? String
            self.onPlayNewItem(songUrl!)
            let postImgUrl:String? = songInfo["picture"] as? String
            self.onSetMusicPostImage(postImgUrl!)
        } else if (results["channels"] != nil) {
            self.channellist = results["channels"] as! NSArray
        }
        
    }

    func onSetMusicPostImage(url:String) -> Void {
        let image:UIImage? = (self.imageCache[url])
        if (image == nil) {
            let imgurl:NSURL = NSURL(string: url)!
            let request: NSURLRequest = NSURLRequest(URL: imgurl)
            let urlSession = NSURLSession.sharedSession()
            let datatask = urlSession.dataTaskWithRequest(request, completionHandler: {
                (data: NSData?, response: NSURLResponse?, error:NSError?)->Void in
                if (error != nil) {
                    print("url request load data error", error?.description)
                } else if data != nil {
                    let img = UIImage(data: (data)!)
                    self.imageCache[url] = img
                    self.iv.image = img
                }
            })
            datatask.resume()
        } else {
            self.iv.image = image;
        }
    }
    
    func onPlayNewItem(url:String) -> Void {
        print(url)
        timer?.invalidate();
        playtime.text = "00:00"
        
        print("start play the music")
        if (audioplayer == nil || url.isEmpty) {
            return; //error
        }
        audioplayer.replaceCurrentItemWithPlayerItem(AVPlayerItem(URL: NSURL(string: url)!))
        audioplayer.play();
        
        //CMTime playDuration = audioplayer.currentItem?.duration;
        //if (CMTIME_IS_INVALID(playerDuration))
        audioplayer.addPeriodicTimeObserverForInterval(CMTimeMakeWithSeconds(1.0, 60),
                                                       queue: nil, usingBlock: {
                                                       (t:CMTime)->Void in
            
                                                        if let item = (self.audioplayer.currentItem) {
                                                            CMTimeGetSeconds(item.duration)
                                                        }
                                                        
        })
    }
    
    func onUpdatePlayProgress() {
        //let t = audioplayer.currentTime();
        //f (c > 0.0) {
            //let t = audioplayer.
        //}
    }
    
    func onChannelSelected(channel_id: String) {
        let url:String = "http://douban.fm/j/mine/playlist?channel=\(channel_id)"
        http.onSearch(url);
    }
    
    
    //override from UItableViewDelegate
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell,
                          forRowAtIndexPath indexPath: NSIndexPath) {
        cell.layer.transform = CATransform3DMakeScale(0.1, 0.1, 0.1)
        UIView.animateWithDuration(0.25, animations: {
            cell.layer.transform = CATransform3DMakeScale(1, 1, 1)
        })
    }
    


}

