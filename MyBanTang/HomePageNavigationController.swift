//
//  HomePageNavigationController.swift
//  MyBanTang
//
//  Created by snqu-ios on 16/3/22.
//  Copyright © 2016年 snqu-ios. All rights reserved.
//

import UIKit

class HomePageNavigationController: BaseNavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        let image = UIImage(named: "Home_unselected")?.imageWithRenderingMode(.AlwaysOriginal)
        let selectedImage = UIImage(named: "Home_selected")?.imageWithRenderingMode(.AlwaysOriginal)
        let tabBarItem = UITabBarItem(title: "首页", image: image, selectedImage: selectedImage)
        self.tabBarItem = tabBarItem
        tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName : UIColor.grayColor()], forState: .Normal)
        tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName : UIColor.redColor()], forState: .Selected)
        
    }
    

}
