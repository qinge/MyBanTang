//
//  HomePageViewController.swift
//  MyBanTang
//
//  Created by snqu-ios on 16/3/22.
//  Copyright © 2016年 snqu-ios. All rights reserved.
//

import UIKit

class HomePageViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var customBar = UIView()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "test"
        self.tabBarItem.title = "首页"
        
//        self.navigationController?.setNavigationBarHidden(true, animated: false)
//        self.navigationController?.hidesBarsOnSwipe = true
        
        if self.respondsToSelector("barHideOnSwipeGestureRecognizer") {
            self.navigationController?.hidesBarsOnSwipe = true
            self.navigationController?.barHideOnSwipeGestureRecognizer.addTarget(self, action: "swipe")
        }
    }
    
    func swipe(){
        let shouldHideStatusBar = self.navigationController!.navigationBar.frame.origin.y < 0
        UIView.animateWithDuration(0.2) { () -> Void in
            self.setNeedsStatusBarAppearanceUpdate()
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
//        self.title = "haha"
    }
    
    
    @IBAction func hideNavigationBar(sender: AnyObject) {
        UIView.animateWithDuration(1.0) { () -> Void in
            var frame = self.navigationController?.navigationBar.frame
                frame?.origin.y = -(frame?.size.height)!
            self.navigationController?.navigationBar.frame = frame!
            self.navigationController?.navigationBar.alpha = 0.0
        }
    }
    
    
    // MARK: - UITableViewDataSource
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let identifier = "cell"
        var cell = tableView.dequeueReusableCellWithIdentifier(identifier)
        if cell == nil {
            cell = UITableViewCell(style: .Default, reuseIdentifier: identifier)
        }
        cell?.textLabel?.text = "item: \(indexPath.row)"
        return cell!
    }
    
    // MARK: - UITableViewDelegate
//    func scrollViewDidScroll(scrollView: UIScrollView) {
//        let contentOfsetY = scrollView.contentOffset.y
//        if contentOfsetY > 0  && contentOfsetY <=  self.navigationController?.navigationBar.frame.size.height {
//            var frame = self.navigationController?.navigationBar.frame
//            frame?.origin.y = -contentOfsetY
//            self.navigationController?.navigationBar.frame = frame!
//        }
//    }
    
    
}
