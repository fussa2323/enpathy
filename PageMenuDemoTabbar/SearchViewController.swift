//
//  SearchViewController.swift
//  PageMenuDemoTabbar
//
//  Created by Yohei Fusayasu on 7/12/15.
//  Copyright (c) 2015 Niklas Fahl. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func searchButton(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
}
