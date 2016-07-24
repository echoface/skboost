//
//  SecondViewController.swift
//  UIpageSwitch
//
//  Created by HuanGong on 16/5/8.
//  Copyright © 2016年 HuanGong. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBAction func go_back_page() {
        print("back")
        self.dismissViewControllerAnimated(false) { 
            print("sencond page dismissed completed")
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
