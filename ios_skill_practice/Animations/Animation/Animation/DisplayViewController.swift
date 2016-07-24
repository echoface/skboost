//
//  DisplayViewController.swift
//  Animation
//
//  Created by HuanGong on 16/5/15.
//  Copyright © 2016年 HuanGong. All rights reserved.
//

import UIKit

class DisplayViewController: UIViewController {

    @IBOutlet var imgView1: UIImageView!
    @IBOutlet var imgView2: UIImageView!
    
    private var rectVisible:Bool = true
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //view.addSubview(ImgView1)
        view.addSubview(imgView2)
        //imgView2.addConstraints(NSLayoutConstraint.)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        func completehandler(ok:Bool) {
            rectVisible = !rectVisible
            print("view transition finished")
        }
        if (!rectVisible) {
            UIView.transitionFromView(imgView1, toView: imgView2, duration: 2, options: UIViewAnimationOptions.TransitionFlipFromRight, completion: completehandler)
        } else {
            UIView.transitionFromView(imgView2, toView: imgView1, duration: 2, options: UIViewAnimationOptions.TransitionFlipFromLeft, completion: completehandler)
        }
        
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
