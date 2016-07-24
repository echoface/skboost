//
//  SpecifiedTableView.swift
//  L08TabViewWidget
//
//  Created by HuanGong on 16/5/7.
//  Copyright © 2016年 HuanGong. All rights reserved.
//

import UIKit

// UITableViewDataSource 负责数据的交互部分
// UITableViewDelegate 负责没一个cell 的动作
// 这里相当于我们同事将mvc 所有的东西都放在一个类SpecifiedTableView里面了....
// 记得在Init函数中将datasource 和 delegate都设置为自己

class SpecifiedTableView: UITableView, UITableViewDataSource, UITableViewDelegate {

    var dictData: NSDictionary? = nil
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        dictData = init_dict_data()
        self.dataSource = self
        self.delegate = self
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return (dictData?.count)!
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (dictData?.allValues[section].count)!
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell")
        let button = cell?.viewWithTag(1) as! UIButton
        let section_value = (dictData?.allValues[indexPath.section] as! NSArray).objectAtIndex(indexPath.row) as! String
        button.setTitle(section_value, forState: UIControlState.Normal)
        
        return cell!
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        // fixed font style. use custom view (UILabel) if you want something different
        return dictData?.allKeys[section] as? String
    }
    
    func init_dict_data() -> NSDictionary {
        let bundle = NSBundle.mainBundle()
        let dict:NSDictionary = NSDictionary(contentsOfURL: bundle.URLForResource("data", withExtension: "plist")!)!
        return dict
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("didselectrowatindepath")
        //当用户点击选择了某一个cell时， 这个会触发哦， 这时候可以通过
        tableView.cellForRowAtIndexPath(indexPath) //来取得UITableViewCell
    }
    
      /*
    func tableView(tableView: UITableView, titleForFooterInSection section: Int) -> String?
    
    // Editing
    
    // Individual rows can opt out of having the -editing property set for them. If not implemented, all rows are assumed to be editable.
    optional func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool
    
    // Moving/reordering
    
    // Allows the reorder accessory view to optionally be shown for a particular row. By default, the reorder control will be shown only if the datasource implements -tableView:moveRowAtIndexPath:toIndexPath:
    optional func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool
    
    // Index
    
    optional func sectionIndexTitlesForTableView(tableView: UITableView) -> [String]? // return list of section titles to display in section index view (e.g. "ABCD...Z#")
    optional func tableView(tableView: UITableView, sectionForSectionIndexTitle title: String, atIndex index: Int) -> Int {
    // tell table which section corresponds to section title/index (e.g. "B",1))
     
    }
    
    // Data manipulation - insert and delete support
    
    // After a row has the minus or plus button invoked (based on the UITableViewCellEditingStyle for the cell), the dataSource must commit the change
    // Not called for edit actions using UITableViewRowAction - the action's handler will be invoked instead
    optional func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath)
    
    // Data manipulation - reorder / moving support
    
    optional func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath)
 
 */
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
}
