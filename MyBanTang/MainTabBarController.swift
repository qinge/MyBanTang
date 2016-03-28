//
//  MainTabBarController.swift
//  MyBanTang
//
//  Created by snqu-ios on 16/3/21.
//  Copyright © 2016年 snqu-ios. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController, UITabBarControllerDelegate {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        changeNavigationBarTintColor()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func changeNavigationBarTintColor(){
        let navArray = self.viewControllers as! [UINavigationController]
        for var i = 0; i < self.viewControllers?.count; i++ {
            let nav = navArray[i]
            // 左右文字颜色
            nav.navigationBar.tintColor = UIColor.whiteColor()
            
            // 导航栏颜色
            nav.navigationBar.barTintColor = CustomBarTintColor
            
            // 标题颜色
            nav.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
            nav.navigationBar.translucent = false
        }
        self.tabBar.barTintColor = UIColor.whiteColor()
        self.tabBar.translucent = false
    }
    
    
    // MARK: - UITabBarControllerDelegate
    func tabBarController(tabBarController: UITabBarController, shouldSelectViewController viewController: UIViewController) -> Bool {
        guard  viewController.isMemberOfClass(ShowNavigationController) else {
            return true
        }
        let showNavigationController = viewController as! ShowNavigationController
        let showViewController = showNavigationController.topViewController as! ShowViewController
        showViewController.openPhotoViewController()
        return false
    }

}
