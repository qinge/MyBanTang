//
//  BannerView.swift
//  MyBanTang
//
//  Created by snqu-ios on 16/3/23.
//  Copyright © 2016年 snqu-ios. All rights reserved.
//
// swift 使用 SDWebImage 创建桥连接文件 引入头文件  #import <SDWebImage/UIImageView+WebCache.h>

import UIKit

let SCROLLVIEW_HEIGHT = 150.0
let TYPE_VIEW_HEIGHT = 50.0

class BannerView: UIView, UIScrollViewDelegate {
    
    var bannerScrollView: UIScrollView!
    var bannerArray = [String]()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.whiteColor()
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func createBannerView() {
        bannerScrollView = UIScrollView(frame: CGRectMake(0, 0, SCREEN_WIDTH, CGFloat(SCROLLVIEW_HEIGHT)))
        bannerScrollView.bounces = false
        bannerScrollView.delegate = self
        bannerScrollView.pagingEnabled = true
        bannerScrollView.showsHorizontalScrollIndicator = false
        
        // 设置内容 利用 n + 2 实现 循环滚动
        let lastImageView = UIImageView(frame: CGRectMake(0, 0, SCREEN_WIDTH, CGFloat(SCROLLVIEW_HEIGHT)))
//        lastImageView.sd_setImageWithURL(<#T##url: NSURL!##NSURL!#>, placeholderImage: UIImage(named: "placeHolder.jpg"))
    }
    
    // MARK: - UIScrollViewDelegate

}

