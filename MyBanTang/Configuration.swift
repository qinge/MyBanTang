//
//  Configuration.swift
//  MyBanTang
//
//  Created by snqu-ios on 16/3/21.
//  Copyright © 2016年 snqu-ios. All rights reserved.
//

import Foundation
import UIKit

public let SCREEN_WIDTH: CGFloat = UIScreen.mainScreen().bounds.size.width
public let SCREEN_HEIGHT: CGFloat = UIScreen.mainScreen().bounds.size.height
public let MainBounds: CGRect = UIScreen.mainScreen().bounds

//app中所用到的字体
public let ThinFont:String = "PingFangSC-Thin"
public let LightFont:String = "PingFangSC-Light"
public let RegularFont:String = "PingFangSC-Regular"


//MARK:文字颜色，背景颜色

extension UIColor {
    convenience init(r: Int, g:Int , b:Int , a: Int) {
        self.init(red: CGFloat(r)/255, green: CGFloat(g)/255, blue: CGFloat(b)/255, alpha: CGFloat(a)/255)
    }

    class func colorWithHexString(colorString: NSString) -> UIColor{
        return colorWithHexString(colorString, alpha: 1.0)
    }
    
    class func colorWithHexString(colorString: NSString, alpha: Float) -> UIColor{
        var cString: NSString = colorString.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet()) as NSString
        if cString.length < 6 {
            return UIColor.clearColor()
        }
        if cString.hasPrefix("0X") {
            cString = cString.substringFromIndex(2)
        }
        if cString.hasPrefix("#") {
            cString = cString.substringFromIndex(1)
        }
        if cString.length != 6 {
            return UIColor.clearColor()
        }
        

        var range = NSRange()
        range.location = 0
        range.length = 2
        
        let rStirng = cString.substringWithRange(range)
        range.location = 2
        let gString = cString.substringWithRange(range)
        range.location = 4
        let bString = cString.substringWithRange(range)
        
        var rValue: UInt32 = 0
        var gValue: UInt32 = 0
        var bValue: UInt32 = 0
        
        NSScanner.localizedScannerWithString(rStirng).scanHexInt(&rValue)
        NSScanner.localizedScannerWithString(gString).scanHexInt(&gValue)
        NSScanner.localizedScannerWithString(bString).scanHexInt(&bValue)
        
        
//        let f = Float(CGFloat(rValue) / 255.0)
        let rf = CGFloat(Float(rValue) / 255.0)
        let gf = CGFloat(Float(gValue) / 255.0)
        let bf = CGFloat(Float(bValue) / 255.0)
        return UIColor(red: rf, green: gf, blue: bf, alpha: CGFloat(alpha))
    }
}


public let CustomBarTintColor = UIColor.colorWithHexString("EC5252")
public let MainTitleColor:UIColor = UIColor.init(red: 109/255.0, green: 109/255.0, blue: 109/255.0, alpha: 1.0)
public let SubTitleColor:UIColor = UIColor.init(red: 153/255.0, green: 153/255.0, blue: 153/255.0, alpha: 1.0)
public let LightLineColor:UIColor = UIColor.colorWithHexString("F9F9F9")
public let GrayLineColor:UIColor = UIColor.colorWithHexString("D8D8D8")
public let TitleGrayCorlor:UIColor = UIColor.colorWithHexString("A7A7A7")
/// textView/textfield placeHolder titleColor
public let PlaceHolderColor:UIColor = UIColor.colorWithHexString("B6B6B6")
/// view灰色背景
public let ViewGrayBackGroundColor = UIColor.colorWithHexString("F5F5F5")
/// 文字半黑色
public let HalfBlackTitleColor:UIColor = UIColor.colorWithHexString("959595")

public var MyFavoriteList = Array() as [String]
public var RecommendList = Array() as [String]

///分割线的 cell 背景颜色
public let CellSeparatotBackColor:UIColor = UIColor.colorWithHexString("EEEEEE")
/// cell 中 商品价格，喜欢人数标签的背景颜色
public let TagBackOrangeColor:UIColor = UIColor.colorWithHexString("FFA429")


struct Configuration {

}