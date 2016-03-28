//
//  ShowMeCollectionViewCell.swift
//  MyBanTang
//
//  Created by snqu-ios on 16/3/28.
//  Copyright © 2016年 snqu-ios. All rights reserved.
//

import UIKit

class ShowMeCollectionViewCell: UICollectionViewCell {
    
    private var imageView: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.buildUI()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func buildUI() {
        // 设置圆角
        self.layer.cornerRadius = 3.0
        self.clipsToBounds = true
        
        imageView = UIImageView(frame: self.bounds)
        imageView.clipsToBounds = true
        imageView.contentMode = .Center
        self.addSubview(imageView)
    }
    
    func configCellImage(image: UIImage?){
        if image == nil {
            self.imageView.image = UIImage(named: "btn_library_camera")
        }else {
            self.imageView.image = image!
        }
    }
    
}
