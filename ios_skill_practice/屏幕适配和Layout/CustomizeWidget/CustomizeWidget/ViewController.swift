//
//  ViewController.swift
//  CustomizeWidget
//
//  Created by HuanGong on 16/5/15.
//  Copyright © 2016年 HuanGong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var bt: UIButton!
    @IBAction func modifyProgress() {
        pcv.setProgressValue(pcv.getProgressValue()+0.02)
    }
    
    @IBAction func increaseValue() {
        pcv.setProgressValue(pcv.getProgressValue()+0.02)
    }
    @IBAction func decreaseValue() {
        pcv.setProgressValue(pcv.getProgressValue()-0.02)
    }
    
    
    private var pcv: ProgressContolView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        bt.alpha = 0.6
        
        pcv = ProgressContolView(frame: CGRect(x: 80, y: 200, width: 100, height: 100))
        pcv.setProgressValue(0.14)
        view.addSubview(pcv)
        
        //bt.setra
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

