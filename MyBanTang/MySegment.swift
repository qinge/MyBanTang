//
//  MySegment.swift
//  MyBanTang
//
//  Created by snqu-ios on 16/3/25.
//  Copyright © 2016年 snqu-ios. All rights reserved.
//

import UIKit

protocol MySegmentButtonClickProtocol {
    func didCheckSquareButton()
    func didCheckInstrestButton()
}

class MySegment: UIView {
    
    @IBOutlet var squareButton: UIButton!
    @IBOutlet var instrestButton: UIButton!
    
    var mySegmentButtonProtocol: MySegmentButtonClickProtocol?
    
    override func awakeFromNib() {
        self.backgroundColor = UIColor.clearColor()
        squareButton.setTitleColor(normalTextColor, forState: .Normal)
        squareButton.setTitleColor(selectedTextColor, forState: .Selected)
        
        instrestButton.setTitleColor(normalTextColor, forState: .Normal)
        instrestButton.setTitleColor(selectedTextColor, forState: .Selected)
        
        squareButton.selected = true
    }

    var currentIndex: CGFloat! {
        didSet{
            if currentIndex == 0 {
                
            }else {
                
            }
        }
    }
    
    
    var normalTextColor = UIColor.colorWithHexString("FFFFFF", alpha: 0.5){
        didSet {
            
        }
    }
    
    var selectedTextColor = UIColor.whiteColor() {
        didSet {
            
        }
    }
    
    @IBAction func squareButtonClicked(sender: UIButton) {
        guard squareButton.selected == false else{
            return
        }
        squareButton.selected = true
        instrestButton.selected = false

        UIView.animateWithDuration(0.1, animations: { () -> Void in
            
            let transform = CGAffineTransformScale(sender.transform, 1.2, 1.2)
            sender.transform = transform
            
            }) { (complete) -> Void in
               sender.transform = CGAffineTransformIdentity
        }
        
        guard mySegmentButtonProtocol != nil else {
            return
        }
        mySegmentButtonProtocol!.didCheckSquareButton()
    }
    
    @IBAction func instrestButtonClicked(sender: UIButton) {
        guard instrestButton.selected == false else {
            return
        }
        squareButton.selected = false
        instrestButton.selected = true
        UIView.animateWithDuration(0.1, animations: { () -> Void in
            
            let transform = CGAffineTransformScale(sender.transform, 1.2, 1.2)
            sender.transform = transform
            
            }) { (complete) -> Void in
                sender.transform = CGAffineTransformIdentity
        }
        
        guard (mySegmentButtonProtocol != nil) else {
            return
        }
        mySegmentButtonProtocol?.didCheckInstrestButton()
    }
}
