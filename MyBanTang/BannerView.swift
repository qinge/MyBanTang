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
    let bannerWidth = SCREEN_WIDTH
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.whiteColor()
        
        self.setUpData()
        
        self.createBannerView()
        
        startTimerForAutoScroll()
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
        
        //第一张放到 index = count+1 的位置
        let xOfset = CGFloat(bannerArray.count + 1) * bannerWidth
        let firstImageView = UIImageView(frame: CGRectMake(xOfset, 0, SCREEN_WIDTH, CGFloat(SCROLLVIEW_HEIGHT)))
        let firstModel = self.bannerArray[0]
        firstImageView.sd_setImageWithURL(NSURL(string: firstModel.imageUrl), placeholderImage: UIImage(named: "placeHolder.jpg"))
        
        bannerScrollView.addSubview(firstImageView)
        
        for var index = 0 ;index < self.bannerArray.count ;index++ {
            let bannerModel = self.bannerArray[index]
            let imageView = UIImageView(frame: CGRectMake(bannerWidth * CGFloat(index + 1), 0, bannerWidth, CGFloat(SCROLLVIEW_HEIGHT)))
            
            imageView.sd_setImageWithURL(NSURL(string: bannerModel.imageUrl), placeholderImage:UIImage(named: "placeHolder.jpg"))
            bannerScrollView.addSubview(imageView)
        }
        
        bannerScrollView.contentSize = CGSizeMake(bannerWidth*CGFloat(bannerArray.count+2), CGFloat(SCROLLVIEW_HEIGHT))
        bannerScrollView.contentOffset = CGPointMake(bannerWidth, 0)
        
        self.addSubview(bannerScrollView)
        
    }
    
    //开启timer
    func startTimerForAutoScroll() {
        timer = NSTimer(timeInterval: 2.0, target: self, selector: "autoMaticScroll", userInfo: nil, repeats: true)
        NSRunLoop.currentRunLoop().addTimer(timer, forMode: NSRunLoopCommonModes)
    }
    
    func autoMaticScroll() {
        // 滑动到最后一张
        if bannerScrollView.contentOffset.x == CGFloat(bannerArray.count + 1) * bannerWidth {
            bannerScrollView.contentOffset = CGPointMake(bannerWidth, 0)
        }
        bannerScrollView.setContentOffset(CGPointMake(bannerScrollView.contentOffset.x + bannerWidth, 0), animated: true)
    }
    
    // MARK: - UIScrollViewDelegate
    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        timer.invalidate()
    }
    
    func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        startTimerForAutoScroll()
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
//        let index = bannerScrollView.contentOffset.x / bannerWidth
        if bannerScrollView.contentOffset.x == 0 {
            // 如果当前页是第0页就跳转到数组中最后一个地方进行跳转
            bannerScrollView.contentOffset = CGPointMake(CGFloat(bannerArray.count) * bannerWidth , 0)
        }else if bannerScrollView.contentOffset.x == CGFloat(bannerArray.count + 1) * bannerWidth {
             // 如果是 最后一页就跳转到数组第一个元素的地点
            bannerScrollView.contentOffset = CGPointMake(bannerWidth, 0)
        }
    }

}

