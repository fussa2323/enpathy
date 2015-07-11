//
//  PageMenuOneViewController.swift
//  PageMenuDemoTabbar
//
//  Created by Niklas Fahl on 1/9/15.
//  Copyright (c) 2015 Niklas Fahl. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class PageMenuOneViewController: UIViewController {
    
    var pageMenu : CAPSPageMenu?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: - Scroll menu setup
        
        // Initialize view controllers to display and place in array
        var controllerArray : [UIViewController] = []
        
        var controller1 : OsusumeTableViewController = OsusumeTableViewController(nibName: "OsusumeTableViewController", bundle: nil)
        controller1.title = "おすすめ"
        controllerArray.append(controller1)
        var controller2 : SandouTableViewController = SandouTableViewController(nibName: "SandouTableViewController", bundle: nil)
        controller2.title = "賛同済イベント"
        controllerArray.append(controller2)
        var controller3 : YoyakuTableViewController = YoyakuTableViewController(nibName: "YoyakuTableViewController", bundle: nil)
        controller3.title = "参加予定イベント"
        controllerArray.append(controller3)
        var controller4 : MyHatsuanTableViewController = MyHatsuanTableViewController(nibName: "MyHatsuanTableViewController", bundle: nil)
        controller4.title = "自分発案したイベント"
        controllerArray.append(controller4)
        
        // Customize menu (Optional)
        var parameters: [CAPSPageMenuOption] = [
            .ScrollMenuBackgroundColor(UIColor.orangeColor()),
            .ViewBackgroundColor(UIColor.whiteColor()),
            .SelectionIndicatorColor(UIColor.whiteColor()),
            .UnselectedMenuItemLabelColor(UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 0.4)),
            .MenuItemFont(UIFont(name: "HelveticaNeue", size: 17)!),
            .MenuHeight(44.0),
            .MenuMargin(70.0),
            .SelectionIndicatorHeight(0.0),
            .BottomMenuHairlineColor(UIColor.orangeColor()),
            .MenuItemWidthBasedOnTitleTextWidth(true),
            .SelectedMenuItemLabelColor(UIColor.whiteColor())
        ]
        
        // Initialize scroll menu
        pageMenu = CAPSPageMenu(viewControllers: controllerArray, frame: CGRectMake(0.0, 60.0, self.view.frame.width, self.view.frame.height - 60.0), pageMenuOptions: parameters)
        
        self.view.addSubview(pageMenu!.view)
    }
    
    func getRandomColor() -> UIColor{
        
        var randomRed:CGFloat = CGFloat(drand48())
        
        var randomGreen:CGFloat = CGFloat(drand48())
        
        var randomBlue:CGFloat = CGFloat(drand48())
        
        return UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1.0)
        
    }
}
