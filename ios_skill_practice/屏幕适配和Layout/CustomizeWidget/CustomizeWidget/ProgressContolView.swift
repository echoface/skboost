//
//  ProgressContolView.swift
//  CustomizeWidget
//
//  Created by HuanGong on 16/5/15.
//  Copyright © 2016年 HuanGong. All rights reserved.
//

import UIKit


// 通过 关键字@IBDesignable 可以将类导出到storyboard, 可以实时的在storyboard中修改并通过
// storyboard 来查看效果
@IBDesignable class ProgressContolView: UIView {

    
    private var _progressValue: CGFloat = 0
    
    // 通过关键字@IBInspectable 可以导出变量到storyboard的属性页面, 这样就可以在属性页面
    // 修改相应的值, 便可以在storyboard中实时的看到变化, didSet
    @IBInspectable var value: CGFloat = 0.5 {
        didSet {
            _progressValue = value;
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        backgroundColor = UIColor(white: 1, alpha: 0)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(white: 1, alpha: 0)
    }
    
    func setProgressValue(value: CGFloat) {
        _progressValue = value
        setNeedsDisplay()
    }
    func getProgressValue() -> CGFloat {
        return _progressValue
    }
        // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
        let ctx = UIGraphicsGetCurrentContext()
        let r = rect.width/2
        
        
        CGContextAddArc(ctx, r, r, r, 0, 3.14159*2, 0)
        CGContextSetRGBFillColor(ctx, 1, 1, 0, 0.8)
        CGContextFillPath(ctx)
        
        
        CGContextAddArc(ctx, r, r, r, 0, 3.1415926*2*_progressValue, 0)
        CGContextAddLineToPoint(ctx, r, r)
        CGContextSetRGBFillColor(ctx, 0, 1, 1, 0.8)
        CGContextFillPath(ctx)
    
    }

}
