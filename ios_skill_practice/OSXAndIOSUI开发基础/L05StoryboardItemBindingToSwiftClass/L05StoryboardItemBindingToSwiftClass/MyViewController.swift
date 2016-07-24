//
//  MyViewController.swift
//  L05StoryboardItemBindingToSwiftClass
//
//  Created by HuanGong on 16/5/7.
//  Copyright © 2016年 HuanGong. All rights reserved.
//

import UIKit

class MyViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        let label = UILabel(frame: CGRect(x: 200, y: 100, width: 200, height: 90))
        label.text = "Name: HuanGong"
        view.addSubview(label)
        
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
