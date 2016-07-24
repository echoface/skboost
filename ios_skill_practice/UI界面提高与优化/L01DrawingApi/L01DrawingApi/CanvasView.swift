//
//  CanvasView.swift
//  L01DrawingApi
//
//  Created by HuanGong on 16/5/8.
//  Copyright © 2016年 HuanGong. All rights reserved.
//

import UIKit

class CanvasView: UIView {

    var drawtype:DrawType? = nil
    var path = CGPathCreateMutable()
    
    // *
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        print("I will Draw a \(drawtype!) here in size:width:\(rect.width),height:\(rect.height)")
        if (nil == drawtype) {
            return
        }
        switch drawtype! {
        case DrawType.Line:
            self.drawLines()
        case DrawType.Rectangle:
            self.drawRectangle()
        case DrawType.Circle:
            self.drawCircle()
        case DrawType.Image:
            drawImage()
        case DrawType.Figure:
            PaiterBoard();
        }
        // Drawing code
    }
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        //let p = (touches as NSSet).anyObject()?.locationInview(self)
        let p = touches.first?.locationInView(self)
        CGPathMoveToPoint(path, nil, (p?.x)!, (p?.y)!)
        
        //(path, nil, touches.locationInView(self), )
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let p = touches.first?.locationInView(self)
        CGPathAddLineToPoint(path, nil, (p?.x)!, (p?.y)!)
        setNeedsDisplay();// 安排一次重绘
    }
    
    //*/
    func PaiterBoard() {
        print("i will draw when i move")
        let context = UIGraphicsGetCurrentContext()
        CGContextAddPath(context, path)
        CGContextStrokePath(context)
    }

    func drawLines() {
        print("i will draw lines here, but i gona sleep now")
        let context = UIGraphicsGetCurrentContext()
        CGContextMoveToPoint(context, 100, 100)
        CGContextAddLineToPoint(context, 100, 200)
        CGContextAddLineToPoint(context, 200, 200)
        
        CGContextSetRGBStrokeColor(context, 255, 0, 0, 1)
        CGContextStrokePath(context)
        
        
        //如果前面已经调用了 绘制的函数，比如CGContextStrokePath 下面就会失败，
        //相当于一个path已经被绘制了，就不在了
        CGContextClosePath(context) //当前path若不是闭合的，这个函数会添加一条直线让当前path闭合
        CGContextFillPath(context)
    }
    func drawRectangle() {
        let context = UIGraphicsGetCurrentContext()
        CGContextAddRect(context, CGRect(x: 110, y: 110, width: 40, height: 40))
        CGContextStrokePath(context)
        
        // 没有用，这里是fill，CGContextSetRGBStrokeColor(context, 255, 0, 0, 1)
        CGContextSetRGBFillColor(context, 255, 0, 0, 0.8)
        CGContextFillRect(context, CGRect(x: 200, y: 200, width: 40, height: 40))
        
        print("i will draw Rectangle here, but i gona sleep now")
    }
    func drawCircle() {
        let context = UIGraphicsGetCurrentContext()
        CGContextAddArc(context, 200, 200, 100, 0, 2*3.14, 0) //0: 顺时针, 1: 逆时针
        CGContextSetLineWidth(context, 6)
        CGContextStrokePath(context)
        CGContextAddArc(context, 200, 200, 90, 0, 2*3.14, 0) //0: 顺时针, 1: 逆时针
        CGContextFillPath(context) //填充
        
        //椭圆的方式来绘制圆
        CGContextAddEllipseInRect(context, CGRect(x: 100, y: 400, width: 100, height: 100))
        CGContextFillPath(context)
        
        //椭圆
        CGContextAddEllipseInRect(context, CGRect(x: 100, y: 600, width: 100, height: 50))
        CGContextFillPath(context)
        
        print("i will draw Circle here, but i gona sleep now")
    }
    
    func drawImage() {
        // UIImage(contentsOfFile: "") 这个借口不能用assets里面的资源,
        let img:UIImage? = UIImage(named: "xxx.png")
        let cgimg:CGImage? = img?.CGImage
        let context = UIGraphicsGetCurrentContext() //保存绘制前的状态
        CGContextSaveGState(context)//保存状态
        CGContextTranslateCTM(context, 10, 400)
        CGContextDrawImage(context, CGRect(x:100,y:100,width:300,height:300), cgimg)
        
        CGContextRestoreGState(context) //恢复之前的状态
    }
    
}
