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
    var pageControl: UIPageControl!
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
        
        // 添加 page controll 
        pageControl = UIPageControl()
        pageControl.numberOfPages = bannerArray.count
        let size = pageControl.sizeForNumberOfPages(bannerArray.count)
        pageControl.frame = CGRectMake(0, 140, size.width, 6)
        pageControl.center = CGPointMake(bannerWidth / 2, pageControl.center.y)
        pageControl.pageIndicatorTintColor = UIColor(red: 228/255.0, green: 228/255.0, blue: 228/255.0, alpha: 1.0)
        pageControl.currentPageIndicatorTintColor = UIColor(red: 253/255.0, green: 99/255.0, blue: 99/255.0, alpha: 1.0)
        pageControl.userInteractionEnabled = false
        pageControl.currentPage = 0
//        pageControl.layer.zPosition = 2
        self.addSubview(pageControl)
        
    }
    
    //开启timer
    func startTimerForAutoScroll() {
        timer = NSTimer(timeInterval: 2.0, target: self, selector: "autoMaticScroll", userInfo: nil, repeats: true)
        NSRunLoop.currentRunLoop().addTimer(timer, forMode: NSRunLoopCommonModes)
    }
    
    func autoMaticScroll() {
        pageControl.currentPage = pageControl.currentPage + 1
        
        // 滑动到虚拟的最后一张(第一页)
        if bannerScrollView.contentOffset.x == CGFloat(bannerArray.count + 1) * bannerWidth {
            bannerScrollView.contentOffset = CGPointMake(bannerWidth, 0)
            
        }
        
        // page controll 跟 scrollview 的 contentOffset 的设置 需要分开判断 因为 page control 在这里是提前设置的(比设置 setContentOffset 早)
        if bannerScrollView.contentOffset.x == CGFloat(bannerArray.count) * bannerWidth {
            pageControl.currentPage = 0
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
        let page = Int( (bannerScrollView.contentOffset.x - bannerWidth) / bannerWidth)
        pageControl.currentPage = page
        if bannerScrollView.contentOffset.x == 0 {
            // 如果当前页是第0页就跳转到数组中最后一个地方进行跳转
            bannerScrollView.contentOffset = CGPointMake(CGFloat(bannerArray.count) * bannerWidth , 0)
            pageControl.currentPage = bannerArray.count - 1
        }else if bannerScrollView.contentOffset.x == CGFloat(bannerArray.count + 1) * bannerWidth {
             // 如果是 最后一页就跳转到数组第一个元素的地点
            bannerScrollView.contentOffset = CGPointMake(bannerWidth, 0)
            pageControl.currentPage = 0
        }
    }

}

