//
//  ViewController.swift
//  SystemUserPreference
//
//  Created by HuanGong on 16/7/3.
//  Copyright © 2016年 HuanGong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var keepalive: Bool! = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        let userdefaults = NSUserDefaults.standardUserDefaults();
        keepalive = userdefaults.boolForKey("keepLiveOnBackground")
        //userdefaults.setBool(true, forKey: "keepLiveOnBackground")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

