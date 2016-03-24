//
//  HomeTitleView.swift
//  MyBanTang
//
//  Created by snqu-ios on 16/3/24.
//  Copyright © 2016年 snqu-ios. All rights reserved.
//

import UIKit

class HomeTitleView: UIScrollView {
    //默认文字 是两位
    private var textLength: CGFloat = 2.0
    
    //默认 button 的间隔
    private var buttonSpacing:CGFloat = 30
    
    private var titleArr = NSArray()
    private var normalColor = UIColor()
    private var highLightColor = UIColor()
    private var fontSize = CGFloat()
    var currentPage:Int = 0
    private var indicator = UIView()  //水平指示器
    
    
    
    /**
     便利构造器
     
     - parameter titleArr:       标题
     - parameter normalColor:    标题默认颜色
     - parameter highlightColor: 标题选中时候颜色
     - parameter fontSize:       标题字体大小
     
     - returns: instance
     */
    convenience init(titleArr:NSArray,normalColor:UIColor,highlightColor:UIColor,fontSize:CGFloat) {
        self.init()
        
        self.titleArr = titleArr
        self.normalColor = normalColor
        self.highLightColor = highlightColor
        self.fontSize = fontSize
        
        self.createTitleLabel()
    }

    
    /**
     便利构造器
     
     - parameter titleArr:       标题
     - parameter normalColor:    标题默认颜色
     - parameter highlightColor: 标题选中时候颜色
     - parameter fontSize:       标题字体大小
     - parameter buttonSpacing:  按钮间距
     
     - returns: instance
     */
    convenience init(titleArr:NSArray,normalColor:UIColor,highlightColor:UIColor,fontSize:CGFloat,textLength: CGFloat,buttonSpacing: CGFloat){
        self.init()
        
        self.titleArr = titleArr
        self.normalColor = normalColor
        self.highLightColor = highlightColor
        self.fontSize = fontSize
        self.buttonSpacing = buttonSpacing
        
        self.createTitleLabel()
    }


    func createTitleLabel() {
        //创建文字button
        for(var index = 0;index < titleArr.count;index++)
        {
            //创建button 并且添加到 scrollview中
            let btn = UIButton(frame:CGRectMake(CGFloat(index)*textLength*fontSize+buttonSpacing*CGFloat(index)+12, 8, textLength*fontSize, fontSize+2))
            
            btn.titleLabel?.font = UIFont.systemFontOfSize(fontSize)
            btn.setTitle(titleArr[index] as? String, forState: UIControlState.Normal)
            btn.tag = index+100
            btn.selected = btn.tag == 100 ? true:false
            btn.setTitleColor(self.normalColor, forState: UIControlState.Normal)
            btn.setTitleColor(self.highLightColor, forState: UIControlState.Selected)
            btn.addTarget(self, action: "changeCateGory:", forControlEvents: UIControlEvents.TouchUpInside)
            self.addSubview(btn)
            
            
        }
        //设置分类的滑动范围
        self.contentSize = CGSizeMake(CGFloat(titleArr.count)*2*fontSize+CGFloat(titleArr.count-1)*30+24, 0)
        
        self.backgroundColor = UIColor.whiteColor()
        self.showsHorizontalScrollIndicator = false
        
        //create bottomView
        indicator = UIView.init(frame: CGRectMake(12, 34, fontSize * textLength, 2))
        indicator.layer.zPosition = 2
        indicator.backgroundColor = highLightColor
        currentPage = 0
        self.addSubview(indicator)
    }
    
    
    func changeCateGory(sender: UIButton){
        if sender.selected == true {
            return
        }
        
        for view in self.subviews {
            if view.isKindOfClass(UIButton) && view.tag != sender.tag {
                let unselectedBth = view as? UIButton
                unselectedBth?.selected = false
            }
        }
        
        sender.selected = true
        
        let clickIndex: Int = sender.tag - 100
        
        UIView.animateWithDuration(0.3) { () -> Void in
            self.indicator.center = CGPointMake(sender.center.x, self.indicator.center.y)
        }
        
        currentPage = clickIndex
        
        // 通知 代理 滑动界面
    }

}
