//
//  ShowViewController.swift
//  MyBanTang
//
//  Created by qinge on 16/3/26.
//  Copyright © 2016年 snqu-ios. All rights reserved.
//

import UIKit

class ShowViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func showMyPhote(){
        let showMeViewController = ShowMeViewController(leftTitle: "取消", rightTitle: "")
        let showMeNavigationController = UINavigationController(rootViewController: showMeViewController)
        self.presentViewController(showMeNavigationController, animated: true, completion: nil)
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
