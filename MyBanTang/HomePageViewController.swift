//
//  HomePageViewController.swift
//  MyBanTang
//
//  Created by snqu-ios on 16/3/22.
//  Copyright © 2016年 snqu-ios. All rights reserved.
//

import UIKit

class HomePageViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchResultsUpdating ,UISearchBarDelegate {
    
    var customBar = UIView()
    var searchController: UISearchController!
    @IBOutlet var tableView: UITableView!
    
    var shouldResetStateBar: Bool!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "test"
        self.tabBarItem.title = "首页"
        
//        self.navigationController?.setNavigationBarHidden(true, animated: false)
//        self.navigationController?.hidesBarsOnSwipe = true
        
        if self.respondsToSelector("barHideOnSwipeGestureRecognizer") {
            
        }
        
        self.navigationController?.hidesBarsOnSwipe = true
        self.navigationController?.barHideOnSwipeGestureRecognizer.addTarget(self, action: "swipe")
        
        self.configureSearchController()
        
        self.navigationItem.titleView = searchController.searchBar
//        tableView.tableHeaderView = searchController.searchBar
        shouldResetStateBar = false
    }
    
    func swipe(){
//        UIApplication.sharedApplication().setStatusBarHidden(true, withAnimation: .Fade)
        self.prefersStatusBarHidden()
        UIView.animateWithDuration(0.2) { () -> Void in
            self.setNeedsStatusBarAppearanceUpdate()
        }
    }
    
    
    
    func configureSearchController() {
        // Initialize and perform a minimum configuration to the search controller.
        searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search here..."
        searchController.searchBar.delegate = self
        searchController.searchBar.sizeToFit()
        
        // Place the search bar view to the tableview headerview.
//        tblSearchResults.tableHeaderView = searchController.searchBar
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return self.navigationController!.navigationBar.frame.origin.y < 0
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        if shouldResetStateBar == true {
            self.navigationController?.navigationBarHidden = false
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
//        self.title = "haha"
        shouldResetStateBar = true;
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
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        self.performSegueWithIdentifier("test", sender: self)
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
    
    
    //MARK: - UISearchResultsUpdating
    func updateSearchResultsForSearchController(searchController: UISearchController){

    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        super.prepareForSegue(segue, sender: sender)
        self.navigationController?.navigationBarHidden = false
        self.navigationController?.hidesBarsOnSwipe = false
    }
    
}
