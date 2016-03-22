//
//  WelcomeViewController.swift
//  MyBanTang
//
//  Created by snqu-ios on 16/3/21.
//  Copyright © 2016年 snqu-ios. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    private let MyWord = ["ManoBoo编写","语言:Swift 2.0 工具:Xcode 7.1","非常感谢运行我的App","有问题或建议请联系我的简书或QQ","页面较多，很多部分并没有做完","请参考首页，首页完成度较高"]
    
    private var backImageView: UIImageView!
    private var showTableView: UITableView!
    private var startButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.clearColor()
        
        self.initView()
        performSelector("startAnimation", withObject: nil, afterDelay: 0.3)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initView(){
        backImageView = UIImageView()
        backImageView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)
        backImageView.image = UIImage(named: "appStartBackImage")
        self.view.addSubview(backImageView)
        
        startButton = UIButton()
        startButton.alpha = 0.0
        startButton.setTitle("开启App之旅", forState: .Normal)
        startButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        startButton.titleLabel?.font = UIFont(name: LightFont, size: 18.0)
        startButton.titleLabel?.textAlignment = .Center
        startButton.sizeToFit()
        startButton.frame = CGRectMake(SCREEN_WIDTH/2 - startButton.frame.width/2 - 10, SCREEN_HEIGHT - 60, startButton.frame.width + 20, startButton.frame.height + 8)
        startButton.layer.cornerRadius = 10.0
        startButton.addTarget(self, action: "toTopViewController", forControlEvents: .TouchUpInside)
        view.addSubview(startButton)
        
        
        showTableView = UITableView(frame: CGRectMake(0, SCREEN_HEIGHT/2, SCREEN_WIDTH, CGFloat(40 * MyWord.count)), style: .Plain)
        showTableView.backgroundColor = UIColor.clearColor()
        showTableView.separatorStyle = .None
        showTableView.delegate = self
        showTableView.dataSource = self
        view.addSubview(showTableView)
    }
    

    //MARK: - UITableViewDataSource
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 40
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MyWord.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("CellIDedtifier")
        if cell == nil {
            cell = UITableViewCell(style: .Default, reuseIdentifier: "CellIDedtifier")
            cell?.backgroundColor = UIColor.clearColor()
            cell?.selectionStyle = .None
            cell?.textLabel?.alpha = 0.0
            cell?.textLabel?.font = UIFont(name: LightFont, size: 20.0)
            cell?.textLabel?.textAlignment = .Center
            cell?.textLabel?.textColor = UIColor.colorWithHexString("99DF07")
        }
        cell?.textLabel?.text = MyWord[indexPath.row]
        
        return cell!
    }
    
    
    //MARK: - UITableViewDelegate
    
    
    //MARK: - 动画
    func startAnimation(){
        weak var weakSelf = self
        UIView.animateWithDuration(4.0, animations: { () -> Void in
            
            weakSelf!.showTableView.frame = CGRectMake(0, SCREEN_HEIGHT/2 - weakSelf!.showTableView.frame.height, SCREEN_WIDTH, weakSelf!.showTableView.frame.height)
            
            for var i = 0 ;i < weakSelf!.MyWord.count ; i++ {
                let cell = weakSelf!.showTableView.cellForRowAtIndexPath(NSIndexPath(forRow: i, inSection: 0))
                UIView.animateWithDuration(0.4, animations: { () -> Void in
                    cell?.textLabel?.alpha = 1.0
                })
                
            }

            
            }) { (finished: Bool) -> Void in
                //延时2s 移除tableview
                UIView.animateWithDuration(0.5, animations: { () -> Void in
                    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(2.0 * Double(NSEC_PER_SEC))), dispatch_get_main_queue(), { () -> Void in
                        weakSelf!.showTableView.removeFromSuperview()
                    })
                })
                weakSelf!.startButton.alpha = 1.0
                weakSelf!.view.userInteractionEnabled = true
        }
    }
    
    
    func toTopViewController(){
        let window = UIApplication.sharedApplication().delegate!.window!
        window!.rootViewController = MainTabBarController()
        self.view.removeFromSuperview()
        self.removeFromParentViewController()
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
