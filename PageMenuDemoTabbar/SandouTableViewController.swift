//
//  SandouTableViewController.swift
//  PageMenuDemoTabbar
//
//  Created by Yohei Fusayasu on 7/11/15.
//  Copyright (c) 2015 Niklas Fahl. All rights reserved.
//

import UIKit

class SandouTableViewController: UITableViewController {
        
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.registerNib(UINib(nibName: "SandouTableViewCell", bundle: nil), forCellReuseIdentifier: "SandouTableViewCell")
    }
    
    override func viewDidAppear(animated: Bool) {
        self.tableView.showsVerticalScrollIndicator = false
        super.viewDidAppear(animated)
        self.tableView.showsVerticalScrollIndicator = true
        
        //        println("recents page: viewDidAppear")
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
        return 10
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell : SandouTableViewCell = tableView.dequeueReusableCellWithIdentifier("SandouTableViewCell") as! SandouTableViewCell
        
        return cell
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 130.0
    }
    
    override func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.001
    }
    
}
