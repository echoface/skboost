//
//  ThirdUIViewController.swift
//  UIpageSwitch
//
//  Created by HuanGong on 16/5/8.
//  Copyright © 2016年 HuanGong. All rights reserved.
//

import UIKit

class ThirdUIViewController: UIViewController {

    var textContentData: String? = nil
    @IBOutlet weak var TextLabel: UILabel!
    
    @IBAction func GoBackToFirstPage(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(false) { 
            print("third page dismissed completed")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //在view完成load的时候， 我们将传递过来的数据赋值给UIlabel显示
        TextLabel.text = textContentData;
        
        // 通过 self.parentViewController可以访问到父界面的viewcontroller， 
        // 所以同样也可以通过和父view到子view同样的方式来完成 子界面->父界面的数据传递

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
