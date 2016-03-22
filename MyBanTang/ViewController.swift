//
//  ViewController.swift
//  MyBanTang
//
//  Created by snqu-ios on 16/3/21.
//  Copyright © 2016年 snqu-ios. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var timer: NSTimer!

    override func viewDidLoad() {
        super.viewDidLoad()
        let window = UIApplication.sharedApplication().delegate!.window!
        window!.rootViewController = self.resolveNextViewController()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//
//    override func viewDidAppear(animated: Bool) {
//        super.viewDidAppear(animated)
//        let delayInSeconds = 2.0
//        let popTime = dispatch_time(DISPATCH_TIME_NOW, Int64( delayInSeconds * Double(NSEC_PER_SEC)))
//        dispatch_after(popTime, dispatch_get_main_queue()) { () -> Void in
//            let window = UIApplication.sharedApplication().delegate!.window!
//            window!.rootViewController = self.resolveNextViewController()
//        }
//    }
    
    func resolveNextViewController() -> UIViewController {
        if NSUserDefaults.standardUserDefaults().objectForKey("FirstStart") != nil {
            return self.storyboard!.instantiateViewControllerWithIdentifier("MainTabBarController")
        }else {
            NSUserDefaults.standardUserDefaults().setObject("FirstStart", forKey: "FirstStart")
            return WelcomeViewController()
        }
    }

}

