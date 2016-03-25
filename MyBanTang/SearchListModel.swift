//
//  SearchListModel.swift
//  MyBanTang
//
//  Created by snqu-ios on 16/3/25.
//  Copyright © 2016年 snqu-ios. All rights reserved.
//


import Foundation


// 搜索清单 model
class SearchListModel:NSObject {
    // 分类 id
    var categoryID:String?
    // 分类 名称
    var name:String?
    // 图片URL
    var iconUrl:String?
    // 英文名
    var en_name:String?
    
    //  广场 viewController 中可能会用到
    var sub_title: String?
    
    
    /**
     返回搜索清单 model
     */
    class func createSearchListModel() -> [SearchListModel]{
        let path = NSBundle.mainBundle().pathForResource("搜索清单", ofType: nil)
        let nsData = NSData(contentsOfFile: path!)
        /// json整体转换为字典
        let Dict = ( try! NSJSONSerialization.JSONObjectWithData(nsData!, options:.AllowFragments) ) as! NSDictionary
        let data = Dict.objectForKey("data") as? NSArray
        
        var searchArr = [SearchListModel]()
        
        for var i = 0 ; i < data?.count ; i++ {
            
            let model = SearchListModel()
            let obj = data![i] as! NSDictionary
            model.categoryID = obj.objectForKey("id") as? String
            model.name = obj.objectForKey("name") as? String
            model.en_name = obj.objectForKey("en_name") as? String
            model.iconUrl = obj.objectForKey("icon") as? String
            
            searchArr.append(model)
        }
        return searchArr
    }
    
}