//
//  HomePageViewController.swift
//  MyBanTang
//
//  Created by snqu-ios on 16/3/22.
//  Copyright © 2016年 snqu-ios. All rights reserved.
//

import UIKit

class HomePageViewController: UIViewController {
    
    var customBar = UIView()
//    @IBOutlet var tableView: UITableView!
    
    var shouldResetStateBar: Bool!
    var shouldGetTitleView: Bool!
    
    @IBOutlet weak var signInButtonItem: UIBarButtonItem!
    
    @IBOutlet weak var searchButtonItem: UIBarButtonItem!
    
    @IBOutlet weak var homePageCollectionView: UICollectionView!
    
    var hpcResuableView: HomePageCollectionReusableView!
    var refreshControl: UIRefreshControl!
    var titleView: HomeTitleView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "首页物品"
        self.tabBarItem.title = "首页"

        self.navigationController?.hidesBarsOnSwipe = true
        self.navigationController?.barHideOnSwipeGestureRecognizer.addTarget(self, action: "swipe")
        
        
        shouldResetStateBar = false
        shouldGetTitleView = true
        
        let collectionViewFlowLayout = homePageCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        collectionViewFlowLayout.sectionInset = UIEdgeInsetsMake(10, 5, 15, 5)
        homePageCollectionView.collectionViewLayout = collectionViewFlowLayout
        
        self.addRefreshControlToCollectionView()
    }
    
    func swipe(){
        self.prefersStatusBarHidden()
        UIView.animateWithDuration(0.2) { () -> Void in
            self.setNeedsStatusBarAppearanceUpdate()
        }
    }

    
    func addRefreshControlToCollectionView() {
        refreshControl = UIRefreshControl()
        refreshControl.tintColor = UIColor.grayColor()
        refreshControl.addTarget(self, action: "refershControlAction", forControlEvents: .ValueChanged)
        self.homePageCollectionView.addSubview(refreshControl)
        self.homePageCollectionView.alwaysBounceVertical = true // 允许垂直反弹才能显示下拉刷新
    }
    
    // MARK: - 有可能会循环引用(测试发现没有循环引用)
    func refershControlAction(){
        print("\(__FUNCTION__)")
        let delayManager = DelayTaskManager()
        delayManager.delay(2.0) { () -> () in
            self.refreshControl.endRefreshing()
        }
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return self.navigationController!.navigationBar.frame.origin.y < 0
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        if shouldResetStateBar == true {
            self.navigationController?.hidesBarsOnSwipe = true
            self.navigationController?.navigationBarHidden = false
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        shouldResetStateBar = true;
    }
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        super.prepareForSegue(segue, sender: sender)
        let segueIdentifier = segue.identifier
        if segueIdentifier == "HomeDetailViewControllerSegue" {
            let homeDetailViewController = segue.destinationViewController
            homeDetailViewController.hidesBottomBarWhenPushed = true
        }
        self.navigationController?.navigationBarHidden = false
        self.navigationController?.hidesBarsOnSwipe = false
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        if scrollView.contentOffset.y >= BANNER_VIEW_HEIGHT && shouldGetTitleView == true {
            shouldGetTitleView = false
            titleView = hpcResuableView.getTitleViewFromReusableView()
            titleView.removeFromSuperview()
            var titleViewFrame = titleView.frame
            titleViewFrame.origin = CGPointMake(0, 0)
            titleView.frame = titleViewFrame
            titleView.tag = TITME_VIEW_TAG
            self.view.addSubview(titleView)
        }else if scrollView.contentOffset.y < BANNER_VIEW_HEIGHT &&  shouldGetTitleView == false {
            shouldGetTitleView = true
            titleView.removeFromSuperview()
            var titleViewFrame = titleView.frame
            titleViewFrame.origin = CGPointMake(0, BANNER_VIEW_HEIGHT)
            titleView.frame = titleViewFrame
            titleView.tag = TITME_VIEW_TAG
            hpcResuableView.addSubview(titleView)
        }
    }
    
}

// MARK: - uitableViewDelegate

extension HomePageViewController: UITableViewDataSource, UITableViewDelegate {
    
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
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //        self.performSegueWithIdentifier("test", sender: self)
    }
}


// MARK: - uitable view 扩展

extension HomePageViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    // MARK: - UICollectionViewDataSource
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 60
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("CollectionViewCell", forIndexPath: indexPath)
        
        return cell
        
    }
    
    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        
        if kind == UICollectionElementKindSectionHeader {
            hpcResuableView = collectionView.dequeueReusableSupplementaryViewOfKind(UICollectionElementKindSectionHeader, withReuseIdentifier: "HomePageCollectionReusableView", forIndexPath: indexPath) as! HomePageCollectionReusableView
        }
        return hpcResuableView
    }
    
    
    // MARK: - UICollectionViewDelegate
}
