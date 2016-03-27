//
//  ShowNavigationController.swift
//  MyBanTang
//
//  Created by qinge on 16/3/26.
//  Copyright © 2016年 snqu-ios. All rights reserved.
//

import UIKit

class ShowNavigationController: UINavigationController {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        let image = UIImage(named: "Show_normal")?.imageWithRenderingMode(.AlwaysOriginal)
        let selectedImage = UIImage(named: "Show_normal")?.imageWithRenderingMode(.AlwaysOriginal)
        let tabBarItem = UITabBarItem(title: nil, image: image, selectedImage: selectedImage)
        self.tabBarItem = tabBarItem
        
        tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName : UIColor.grayColor()], forState: .Normal)
        tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName : UIColor.redColor()], forState: .Selected)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
