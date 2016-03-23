//
//  HomePageCollectionReusableView.swift
//  MyBanTang
//
//  Created by snqu-ios on 16/3/23.
//  Copyright © 2016年 snqu-ios. All rights reserved.
//

import UIKit

class HomePageCollectionReusableView: UICollectionReusableView {
    
    override func awakeFromNib() {
        print("HomePageCollectionReusableView: \(__FUNCTION__)")
        let bannerView = BannerView(frame: CGRectMake(0, 0, SCREEN_WIDTH, 150))
        self.addSubview(bannerView)
        
    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//        print("HomePageCollectionReusableView:  \(__FUNCTION__)")
//    }
    
}
