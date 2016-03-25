//
//  PlantGrassTeamModel.swift
//  MyBanTang
//
//  Created by snqu-ios on 16/3/25.
//  Copyright © 2016年 snqu-ios. All rights reserved.
//

import Foundation

class PlantGrassTeamModel {
    
    var teamID: String?
    var teamName: String?
    
    //首页显示的是  第二张图片
    var pic1: String?
    var pic2: String?
    var pic3: String?
    
    
    /// 浏览次数
    var lookCount: Int?
    /// 喜欢次数
    var likeCount: Int?
    /// 帖子数量
    var postsCount: Int?
    /// 详情描述
    var teamDetail: String?
    
    
    //从 json 中读取数据 并返回 listdata
    class private func readfromJSON() -> NSArray {
        let path = NSBundle.mainBundle().pathForResource("种草小分队", ofType: nil)
        let nsData = NSData(contentsOfFile: path!)
        
        // json整体转换为字典
        let dict = (try! NSJSONSerialization.JSONObjectWithData(nsData!, options: .AllowFragments)) as! NSDictionary
        let dataDic = dict["data"] as! NSDictionary
        let listData = dataDic["list"] as! NSArray
        return listData
    }
    
    
    class func readTeamData() -> [PlantGrassTeamModel]{
        var teamArray = [PlantGrassTeamModel]()
        let listData = PlantGrassTeamModel.readfromJSON()
        for var i = 0 ; i < listData.count ; i++ {
            let modelData = listData[i] as! NSDictionary
            let model = PlantGrassTeamModel()
            model.teamID = modelData.objectForKey("id") as? String
            model.teamName = modelData.objectForKey("name") as? String
            model.pic1 = modelData.objectForKey("pic1") as? String
            model.pic2 = modelData.objectForKey("pic2") as? String
            model.pic3 = modelData.objectForKey("pic3") as? String
            
            model.teamDetail = modelData.objectForKey("desc") as? String
            
            let dynamicData = modelData.objectForKey("dynamic") as! NSDictionary
            model.lookCount = dynamicData.objectForKey("views") as? Int
            model.likeCount = dynamicData.objectForKey("attentions") as? Int
            model.postsCount = dynamicData.objectForKey("posts") as? Int
            
            teamArray.append(model)
        }
        
        return teamArray
    }

}