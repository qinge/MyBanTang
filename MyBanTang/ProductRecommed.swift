//
//  ProductRecommed.swift
//  MyBanTang
//
//  Created by snqu-ios on 16/3/23.
//  Copyright © 2016年 snqu-ios. All rights reserved.
//

import Foundation

class ProductRecommend: NSObject {
    
    var fileName = "app_JSON"
    let jsonNameArray = ["app_JSON","json_Art","json_Gift","json_Guide","json_LoveBeauty","json_Design","json_Eater",
        "json_Kitchen","json_WageEarners","json_Student","json_Party","json_Holiday","json_Dormitory"]
    var productArr = [String]()
    var categoryArr = [String]()
    var bannerArr = [String]()
    var dict = [String]()
    
    
    func getDataFromJSONFile(fileIndex: Int) {
        fileName = jsonNameArray[fileIndex]
        let path = NSBundle.mainBundle().pathForResource(fileName, ofType: nil)
    }
    
    class func createDailyBannerModel() -> [DailyBannerModel] {
        let product = ProductRecommend()
//        product.get
        return [DailyBannerModel]()
    }
    
}



/// 每日轮播图
class DailyBannerModel{
    /// id
    var bannerID:String?
    /// 标题
    var title:String?
    /// 子标题
    var subTitle:String?
    /// 类型
    var type:String?
    /// 图片url
    var imageUrl:String!
}