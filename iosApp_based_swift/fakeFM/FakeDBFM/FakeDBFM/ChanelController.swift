//
//  ChanelController.swift
//  FakeDBFM
//
//  Created by HuanGong on 16/7/10.
//  Copyright © 2016年 HuanGong. All rights reserved.
//

import UIKit

protocol channelprotocol {
    func onChannelSelected(channel_id: String) -> Void;
}

class ChanelController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tv: UITableView!
    var channelData:NSArray = NSArray();
    var channel_delegate: channelprotocol? = nil;
    
    @IBAction func BackToParentView(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //@
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return channelData.count;
    }
    
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "channel")
        let data:NSDictionary = self.channelData[indexPath.row] as! NSDictionary
        cell.textLabel?.text = data["name"] as? String
        return cell;
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let data:NSDictionary = self.channelData[indexPath.row] as! NSDictionary
        let channel_id:String = data["channel_id"] as! String
        if (channel_delegate != nil) {
            channel_delegate?.onChannelSelected(channel_id);
        }
        self.dismissViewControllerAnimated(true, completion: nil)
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

