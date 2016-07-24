//
//  ViewController.swift
//  UIpageSwitch
//
//  Created by HuanGong on 16/5/8.
//  Copyright © 2016年 HuanGong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var inputdata_field: UITextField!
    
    @IBAction func JumpToNextPage(sender: AnyObject) {
        print("go to next page")
        let xibViewController = ThirdUIViewController(nibName: "ThirdUIViewController", bundle: nil)
        xibViewController.textContentData = inputdata_field.text
        
        presentViewController(xibViewController, animated: false) {
            print("present view controller finished")
        }
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

