//
//  ShowMeNavigationController.swift
//  MyBanTang
//
//  Created by snqu-ios on 16/3/28.
//  Copyright © 2016年 snqu-ios. All rights reserved.
//

import UIKit

class ShowMeNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupNavigationBar()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func setupNavigationBar() {
        // 左右文字颜色
        self.navigationBar.tintColor = UIColor.whiteColor()
        
        // 导航栏颜色
        self.navigationBar.barTintColor = CustomBarTintColor
        
        // 标题颜色
        self.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        self.navigationBar.translucent = false
    }

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
