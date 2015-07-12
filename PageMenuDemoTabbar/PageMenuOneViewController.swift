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
import Bolts

class PageMenuOneViewController: UIViewController, PFLogInViewControllerDelegate, PFSignUpViewControllerDelegate {
    
    var pageMenu : CAPSPageMenu?
    let mainColor: UIColor = UIColor(red: 230/255, green: 126/255, blue: 53/255, alpha: 1.0)
    
    
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
            .MenuItemFont(UIFont(name: "HelveticaNeue", size: 16)!),
            .MenuHeight(44.0),
            .MenuMargin(50.0),
            .SelectionIndicatorHeight(2.0),
            .BottomMenuHairlineColor(UIColor.whiteColor()),
            .MenuItemWidthBasedOnTitleTextWidth(true),
            .SelectedMenuItemLabelColor(UIColor.whiteColor())
        ]
        
        // Initialize scroll menu
        pageMenu = CAPSPageMenu(viewControllers: controllerArray, frame: CGRectMake(0.0, 60.0, self.view.frame.width, self.view.frame.height - 60.0), pageMenuOptions: parameters)
        
        self.view.addSubview(pageMenu!.view)
    }
    
    override func viewDidAppear(animated: Bool) {
//        self.viewDidAppear(animated)
        //ログアウトしている状態での処理
        if((PFUser.currentUser()) == nil){
            
            //Parse TwitterLogin
            var loginViewController = PFLogInViewController()
            loginViewController.fields = PFLogInFields.UsernameAndPassword | PFLogInFields.LogInButton | PFLogInFields.SignUpButton |
                PFLogInFields.PasswordForgotten | PFLogInFields.Twitter | PFLogInFields.Facebook
            
            loginViewController.delegate = self
            
            var signUpViewController = PFSignUpViewController()
            signUpViewController.delegate = self
            
            loginViewController.signUpController = signUpViewController
            
            //loginViewControllerのデザイン変更
            loginViewController.logInView?.backgroundColor = mainColor
//            // UIImageViewを作成する.
            var myImageView = UIImageView(frame: CGRectMake(0,0,260,160))
            let myImage = UIImage(named: "login-logo.png")
            myImageView.image = myImage
            myImageView.layer.position = CGPoint(x: self.view.bounds.width/2, y: 110.0)
            loginViewController.logInView?.addSubview(myImageView)
            
            self.presentViewController(loginViewController, animated: true, completion: nil)
            
        }

    }
    
    func logInViewController(logInController: PFLogInViewController, shouldBeginLogInWithUsername username: String, password: String) -> Bool {
        if (!username.isEmpty || !password.isEmpty){
            return true
        }else{
            return false
        }
    }
    
    func logInViewController(logInController: PFLogInViewController, didLogInUser user: PFUser) {
        if PFTwitterUtils.isLinkedWithUser(user) {
            
            var twitterUsername = PFTwitterUtils.twitter()?.screenName
            PFUser.currentUser()?.username = twitterUsername
            PFUser.currentUser()?.saveEventually(nil)
        }
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func logInViewController(logInController: PFLogInViewController, didFailToLogInWithError error: NSError?) {
        println("Failed to login...")
    }
    
    @IBAction func logoutButton(sender: AnyObject) {
        PFUser.logOutInBackground()
    }
    
    func getRandomColor() -> UIColor{
        
        var randomRed:CGFloat = CGFloat(drand48())
        
        var randomGreen:CGFloat = CGFloat(drand48())
        
        var randomBlue:CGFloat = CGFloat(drand48())
        
        return UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1.0)
        
    }
}
