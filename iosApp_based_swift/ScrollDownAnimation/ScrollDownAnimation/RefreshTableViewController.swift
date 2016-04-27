//
//  RefreshTableViewController.swift
//  ScrollDownAnimation
//
//  Created by HuanGong on 16/2/28.
//  Copyright © 2016年 HuanGong. All rights reserved.
//

import UIKit

class RefreshTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 10
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let identifier="cell_id";
        var cell=tableView.dequeueReusableCellWithIdentifier(identifier);
        if(cell == nil){
            cell=UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: identifier);
        }
        
        cell?.textLabel?.text = "头像0"
        return cell!;
    }
}
