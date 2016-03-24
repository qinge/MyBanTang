//
//  HomePageCollectionReusableView.swift
//  MyBanTang
//
//  Created by snqu-ios on 16/3/23.
//  Copyright © 2016年 snqu-ios. All rights reserved.
//

import UIKit

public let BANNER_VIEW_HEIGHT: CGFloat = 150.0
public let TITME_VIEW_TAG = 100
class HomePageCollectionReusableView: UICollectionReusableView {
    
    
    let TITLE_VIEW_HEIGHT: CGFloat = 36.0
    
    
    
    override func awakeFromNib() {
        print("HomePageCollectionReusableView: \(__FUNCTION__)")
        let bannerView = BannerView(frame: CGRectMake(0, 0, SCREEN_WIDTH, BANNER_VIEW_HEIGHT))
        self.addSubview(bannerView)
        
        
        //创建标题数组
        let titleArr = NSArray.init(objects: "最新","文艺","礼物","指南","爱美","设计","吃货","厨房","上班","学生","聚会","节日","宿舍")
        
        let titleView = HomeTitleView(titleArr: titleArr, normalColor: SubTitleColor, highlightColor: UIColor.redColor(), fontSize: 16.0)
        titleView.frame = CGRectMake(0, BANNER_VIEW_HEIGHT,SCREEN_WIDTH , TITLE_VIEW_HEIGHT)
        titleView.tag = TITME_VIEW_TAG
        self.addSubview(titleView)
        
    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//        print("HomePageCollectionReusableView:  \(__FUNCTION__)")
//    }
    
    func  getTitleViewFromReusableView() -> HomeTitleView {
        return viewWithTag(TITME_VIEW_TAG) as! HomeTitleView
    }
    
}
