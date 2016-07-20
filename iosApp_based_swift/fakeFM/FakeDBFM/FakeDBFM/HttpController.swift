//
//  HttpController.swift
//  FakeDBFM
//
//  Created by HuanGong on 16/7/11.
//  Copyright © 2016年 HuanGong. All rights reserved.
//

import UIKit

protocol HttpProtocol {
    func didRecieveResults(results: NSDictionary) -> Void
}

class HttpController: NSObject {
    
    var delegate: HttpProtocol?
    
    
    func onSearch(url:String) {
        let nsUrl: NSURL = NSURL(string: url)!
        let request: NSURLRequest = NSURLRequest(URL: nsUrl)
        
        let urlSession = NSURLSession.sharedSession()
        let datatask = urlSession.dataTaskWithRequest(request, completionHandler: {
            (data: NSData?, response: NSURLResponse?, error:NSError?)->Void in
            
            if (error != nil) {
                print("url request load data error", error?.description)
                return
            } else if data != nil {
                let jsonData = try? NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers)
                self.delegate?.didRecieveResults(jsonData as! NSDictionary)
            }
        })
        
        datatask.resume()
        /*
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue(), completionHandler: {
            (response:NSURLResponse?, data: NSData?, error:NSError?)->Void in
            
            let jsonData = try! NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as! NSDictionary
            
            //var jsonData:NSDictionary = NSJSONSerialization.JSONObjectWithData(data, options:NSJSONReadingOptions.MutableContainers) as! NSDictionary
            self.delegate?.didRecieveResults(jsonData)
        })*/
    }
}
