//
//  HomePageViewController.swift
//  MyBanTang
//
//  Created by snqu-ios on 16/3/22.
//  Copyright © 2016年 snqu-ios. All rights reserved.
//

import UIKit

class HomePageViewController: UIViewController {
    
    var customBar = UIView()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "test"
        self.tabBarItem.title = "首页"
        
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)

    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
//        self.title = "haha"
    }
    
    
    
}
