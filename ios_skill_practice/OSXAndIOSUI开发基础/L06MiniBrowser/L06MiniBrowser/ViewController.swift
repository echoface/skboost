//
//  ViewController.swift
//  L06MiniBrowser
//
//  Created by HuanGong on 16/5/7.
//  Copyright © 2016年 HuanGong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var urlinput: UITextField? = nil
    @IBOutlet var btn_go: UIButton? = nil
    @IBOutlet var webview: UIWebView? = nil
    
    @IBAction func LoadNewPage(sender: AnyObject) {
        print("loadnewpage enter")
        
        if (!urlinput!.hasText()) {
            return
        }
        let url = urlinput!.text
        print("start load url \(url)")
        webview!.loadRequest(NSURLRequest(URL: NSURL(string: url!)!))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

