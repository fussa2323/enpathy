//
//  SandouTableViewController.swift
//  PageMenuDemoTabbar
//
//  Created by Yohei Fusayasu on 7/11/15.
//  Copyright (c) 2015 Niklas Fahl. All rights reserved.
//

import UIKit
import Parse

class SandouTableViewController: UITableViewController {
    
    //event 用のデータ定義
    var alleventData:NSMutableArray = NSMutableArray()
    
    //Informationテーブルのデータをすべて読み込む
    func loadInfoData(){
        //初期化
        alleventData.removeAllObjects()
        
        //タイムライン用のクエリを定義
        var findEvent: PFQuery = PFQuery(className: "Event")
        
        //クエリで取得したデータに対しての処理
//        SVProgressHUD.show()
        findEvent.findObjectsInBackgroundWithBlock{
            (objects: [AnyObject]?, error: NSError?) -> Void in
            if error == nil {
                println("Successfully retrieved \(objects!.count) scores.")
                if let objects = objects as? [PFObject] {
                    for object in objects {
                        self.alleventData.addObject(object)
                    }
                }
//                SVProgressHUD.dismiss()
            } else {
                println("Error: \(error!) \(error!.userInfo!)")
            }
            
            //NSArray型にいったん格納して順番をリバースさせる
            let array: NSArray = self.alleventData.reverseObjectEnumerator().allObjects
            self.alleventData = NSMutableArray(array: array)
            self.tableView.reloadData()
        }
        
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.registerNib(UINib(nibName: "SandouTableViewCell", bundle: nil), forCellReuseIdentifier: "SandouTableViewCell")
    }
    
    override func viewDidAppear(animated: Bool) {
//        self.tableView.showsVerticalScrollIndicator = false
        super.viewDidAppear(animated)
//        self.tableView.showsVerticalScrollIndicator = true
        self.loadInfoData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return self.alleventData.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:SandouTableViewCell = (tableView.dequeueReusableCellWithIdentifier("SandouTableViewCell", forIndexPath: indexPath) as! SandouTableViewCell)
        let event:PFObject = (self.alleventData.objectAtIndex(indexPath.row) as! PFObject)
        
        cell.titleLabel.text = event.objectForKey("title") as? String
        cell.tagLabel.text = event.objectForKey("tag") as? String
        cell.dateLabel.text = event.objectForKey("date") as? String
        cell.timeLabel.text = event.objectForKey("time") as? String
        cell.placeLabel.text = event.objectForKey("place") as? String
        
        return cell
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 130.0
    }
    
    override func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.001
    }
    
}
