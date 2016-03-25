//
//  MySegment.swift
//  MyBanTang
//
//  Created by snqu-ios on 16/3/25.
//  Copyright © 2016年 snqu-ios. All rights reserved.
//

import UIKit

class MySegment: UIView {
    

    override func awakeFromNib() {
        self.backgroundColor = UIColor.clearColor()
    }
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    
    
    @IBAction func squareButtonClicked(sender: UIButton) {
        print("\(__FUNCTION__)")
    }
    
    @IBAction func instrestButtonClicked(sender: UIButton) {
        print("\(__FUNCTION__)") 
    }
}
