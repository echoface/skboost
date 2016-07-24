//
//  DrawTableViewController.swift
//  L01DrawingApi
//
//  Created by HuanGong on 16/5/8.
//  Copyright © 2016年 HuanGong. All rights reserved.
//

import UIKit

class DrawTableViewController: UITableViewController {

    let drawList = ["Draw Lines", "Draw Rectangle", "Draw Circles", "Draw Image", "手势绘图"]
    var currentSelectedDrawItem: DrawType? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return drawList.count
    }

    ///*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        let label = cell.viewWithTag(1) as! UILabel
        label.text = drawList[indexPath.row]
        // Configure the cell...

        return cell
    }
    //*/

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print(indexPath.row)
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    // *
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        let new_view = segue.destinationViewController as! PaletteViewController
        
        if let indexPath = self.tableView.indexPathForSelectedRow {
            switch indexPath.row {
            case 0:
                new_view.type = DrawType.Line
            case 1:
                new_view.type = DrawType.Rectangle
            case 2:
                new_view.type = DrawType.Circle
            case 3:
                new_view.type = DrawType.Image
            case 4:
                new_view.type = DrawType.Figure
            default:
                new_view.type = nil
            }
            //let object : NSDictionary = listVideos[indexPath.row] as NSDictionary
            //(segue.destinationViewController as JieDetailViewController).detailItem = object
        }
    }
//    * /

}
