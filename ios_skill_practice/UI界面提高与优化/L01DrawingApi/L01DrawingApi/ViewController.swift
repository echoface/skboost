//
//  ViewController.swift
//  L01DrawingApi
//
//  Created by HuanGong on 16/5/8.
//  Copyright © 2016年 HuanGong. All rights reserved.
//

import UIKit
enum DrawType{
    case Line
    case Circle
    case Rectangle
    case Image
    case Figure
}

class PaletteViewController: UIViewController {

    var type:DrawType? = nil
    
    @IBOutlet var uiCanvans: CanvasView!
    @IBOutlet weak var label: UILabel!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        uiCanvans.drawtype = type
        switch type! {
        case DrawType.Line:
            label.text = "Line"
        case DrawType.Rectangle:
            label.text = "Rectangle"
        case DrawType.Circle:
            label.text = "Circle"
        case DrawType.Image:
            label.text = "Image"
        case DrawType.Figure:
            label.text = "Figure"
        default:
            label.text = "Nothing"
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

