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
    var bannerArray = [DailyBannerModel]()
    var timer: NSTimer!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.whiteColor()
        
        self.setUpData()
        
        self.createBannerView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpData(){
        bannerArray =  ProductRecommend.createDailyBannerModel()
    }
    
    func createBannerView() {
        bannerScrollView = UIScrollView(frame: CGRectMake(0, 0, SCREEN_WIDTH, CGFloat(SCROLLVIEW_HEIGHT)))
        bannerScrollView.bounces = false
        bannerScrollView.delegate = self
        bannerScrollView.pagingEnabled = true
        bannerScrollView.showsHorizontalScrollIndicator = false
        
        // 设置内容 利用 n + 2 实现 循环滚动
        
         //最后一张放到index = 0的位置
        let lastImageView = UIImageView(frame: CGRectMake(0, 0, SCREEN_WIDTH, CGFloat(SCROLLVIEW_HEIGHT)))
        let bannerModel = self.bannerArray[bannerArray.count - 1]
        lastImageView.sd_setImageWithURL(NSURL(string: bannerModel.imageUrl), placeholderImage: UIImage(named: "placeHolder.jpg"))
        
        bannerScrollView.addSubview(lastImageView)
        
        //第一张放到 index = count 的位置
        let xOfset = CGFloat(bannerArray.count + 1) * SCREEN_WIDTH
        let firstImageView = UIImageView(frame: CGRectMake(xOfset, 0, SCREEN_WIDTH, CGFloat(SCROLLVIEW_HEIGHT)))
        let firstModel = self.bannerArray[0]
        firstImageView.sd_setImageWithURL(NSURL(string: firstModel.imageUrl), placeholderImage: UIImage(named: "placeHolder.jpg"))
        
        for var index = 0 ;index < self.bannerArray.count ;index++ {
            let bannerModel = self.bannerArray[index]
            let imageView = UIImageView(frame: CGRectMake(SCREEN_WIDTH * CGFloat(index + 1), 0, SCREEN_WIDTH, CGFloat(SCROLLVIEW_HEIGHT)))
            
            imageView.sd_setImageWithURL(NSURL(string: bannerModel.imageUrl), placeholderImage:UIImage(named: "placeHolder.jpg"))
            bannerScrollView.addSubview(imageView)
        }
        
        bannerScrollView.contentSize = CGSizeMake(SCREEN_WIDTH*CGFloat(bannerArray.count+2), CGFloat(SCROLLVIEW_HEIGHT))
        bannerScrollView.contentOffset = CGPointMake(SCREEN_WIDTH, 0)
        
        self.addSubview(bannerScrollView)
        
    }
    
    //开启timer
    func startTimerForAutoScroll() {
        timer = NSTimer(timeInterval: 3.0, target: self, selector: "autoMaticScroll", userInfo: nil, repeats: true)
        NSRunLoop.currentRunLoop().addTimer(timer, forMode: NSRunLoopCommonModes)
    }
    
    func autoMaticScroll() {
        
    }
    
    // MARK: - UIScrollViewDelegate

}

