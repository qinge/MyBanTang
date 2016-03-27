//
//  ShowMeViewController.swift
//  MyBanTang
//
//  Created by qinge on 16/3/26.
//  Copyright © 2016年 snqu-ios. All rights reserved.
//

import UIKit

class ShowMeViewController: UIViewController {
    
    init(leftTitle:String,rightTitle:String)
    {
        super.init(nibName: nil, bundle: nil)
        
        hidesBottomBarWhenPushed = true
        
        var  backButtonItem = UIBarButtonItem.init()
        if(leftTitle == ""){
            backButtonItem = UIBarButtonItem.init(image: UIImage(named: "back"), style: .Done, target: self, action: "barCancel")
        }else{
            backButtonItem = UIBarButtonItem.init(title: leftTitle, style: .Done, target: self, action:"barCancel")
        }
        
        backButtonItem.tintColor = UIColor.whiteColor()
        navigationItem.leftBarButtonItem = backButtonItem
        
        var completeButtomItem = UIBarButtonItem.init()
        if(rightTitle != ""){
            completeButtomItem = UIBarButtonItem.init(title: rightTitle, style: .Done, target: self, action: "barOK")
            navigationItem.rightBarButtonItem = completeButtomItem
        }
        completeButtomItem.tintColor = UIColor.whiteColor()
        
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.orangeColor()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func barCancel() {
        navigationController?.dismissViewControllerAnimated(true, completion: nil)
        navigationController?.popViewControllerAnimated(true)
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
