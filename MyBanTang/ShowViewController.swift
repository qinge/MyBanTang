//
//  ShowViewController.swift
//  MyBanTang
//
//  Created by qinge on 16/3/26.
//  Copyright © 2016年 snqu-ios. All rights reserved.


import UIKit

import Photos
import AssetsLibrary


class ShowViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    func openPhotoViewController() {
        let showViewController = ShowMeViewController(leftTitle: "取消", rightTitle: "完成")
        let showMeNavigationController = ShowMeNavigationController(rootViewController: showViewController)
        self.presentViewController(showMeNavigationController, animated: true, completion: nil)
    }
    
    
}

