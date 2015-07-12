//
//  AddEventViewController.swift
//  PageMenuDemoTabbar
//
//  Created by Yohei Fusayasu on 7/12/15.
//  Copyright (c) 2015 Niklas Fahl. All rights reserved.
//

import UIKit
import Parse

class AddEventViewController: UIViewController {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var tagLabel: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var timeTextField: UITextField!
    @IBOutlet weak var placeTextField: UITextField!
    @IBOutlet weak var joinNumTextField: UITextField!
    @IBOutlet weak var summary: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveBUtton(sender: AnyObject) {
        var event:PFObject = PFObject(className: "Event")
        event["title"] = titleTextField.text
        event["tag"] = tagLabel.text
        event["date"] = dateTextField.text
        event["time"] = timeTextField.text
        event["place"] = placeTextField.text
        event["join_num"] = joinNumTextField.text
        event["summary"] = summary.text
        
        event.saveInBackgroundWithBlock {
            (success: Bool, error: NSError?) -> Void in
            if (success) {
//                self.navigationController?.popToRootViewControllerAnimated(true)
                self.dismissViewControllerAnimated(true, completion: nil)
            } else {
                // There was a problem, check error.description
            }
        }
        
    }

}
