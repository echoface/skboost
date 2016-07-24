//
//  ViewController.swift
//  UIBinding2Code
//
//  Created by HuanGong on 16/5/6.
//  Copyright © 2016年 HuanGong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var imgview: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        imgview.image = UIImage(named:  "xxx.png");
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

