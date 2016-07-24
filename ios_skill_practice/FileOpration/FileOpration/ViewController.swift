//
//  ViewController.swift
//  FileOpration
//
//  Created by HuanGong on 16/6/19.
//  Copyright © 2016年 HuanGong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var searchpath = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.AllDomainsMask, true)
        var count = 0
        while (count < searchpath.count) {
            
            print(searchpath[count])
            count += 1
        }

        let pathurl = NSURL(fileURLWithPath: "\(searchpath[0])/data.txt")
        
        var data = NSMutableData()
        data.appendData(NSData(data: "你好你好呵呵呵".dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: true)!))
        data.writeToURL(NSURL(fileURLWithPath: "\(searchpath[0])/data.txt"), atomically: true)
        //data.writeToFile(, options: <#T##NSDataWritingOptions#>)
        print("end")
        
        
        
        var data_from_file = NSData(contentsOfFile: pathurl.path!)
        let str = NSString(data: data_from_file!, encoding: NSUTF8StringEncoding)
        do {
            let str2 = try NSString(contentsOfURL: pathurl, encoding: NSUTF8StringEncoding)
            print(str2)
        } catch {
            
        }
        
        print(str)
       
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

