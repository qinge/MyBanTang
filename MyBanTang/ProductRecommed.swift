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
    var bannerArr = [DailyBannerModel]()
    var dict = NSDictionary()
    
    
    func getDataFromJSONFile(fileIndex: Int) {
        fileName = jsonNameArray[fileIndex]
        let path = NSBundle.mainBundle().pathForResource(fileName, ofType: nil)
        let data = NSData(contentsOfFile: path!)
        do {
            self.dict = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments) as! NSDictionary
        } catch {
            
        }
        
    }
    
    class func createDailyBannerModel() -> [DailyBannerModel] {
        let product = ProductRecommend()
        product.getDataFromJSONFile(0)
        let dataArr = product.dict.objectForKey("data") as! NSDictionary
        
        //从data数组汇总解析出 bannerArray
        let bannerArr = dataArr["banner"] as! NSArray
        for obj in bannerArr {
            let model = DailyBannerModel()
//            model.setValuesForKeysWithDictionary(keyedValues: [String : AnyObject])
            model.bannerID = ( obj.objectForKey("id") ) as? String
            model.title = (obj.objectForKey("title")) as? String
            model.subTitle = obj.objectForKey("tags") as? String
            model.imageUrl = obj.objectForKey("photo") as! String
            model.type = obj.objectForKey("type") as? String
            product.bannerArr.append(model)
        }
        return product.bannerArr
    }
    
}



/// 每日轮播图
class DailyBannerModel : NSObject{
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