//
//  SquareCollectionViewCell.swift
//  MyBanTang
//
//  Created by qinge on 16/3/26.
//  Copyright © 2016年 snqu-ios. All rights reserved.
//

import UIKit

var i = 0

class SquareCollectionViewCell: UICollectionViewCell {
    

    
    override func awakeFromNib() {
        super.awakeFromNib()
        print("i = \(i++)")
    }
    
}
