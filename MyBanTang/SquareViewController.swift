//
//  SquareViewController.swift
//  MyBanTang
//
//  Created by snqu-ios on 16/3/22.
//  Copyright © 2016年 snqu-ios. All rights reserved.
//

import UIKit

class SquareViewController: UIViewController, MySegmentButtonClickProtocol, UICollectionViewDataSource, UICollectionViewDelegate {
    
    private var segmentView: MySegment!
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    
    // 种草小分队
    @IBOutlet var collectionView: UICollectionView!
    
    var squareReusableHeadView: SquareCollectionReusableView!
    
    //model
    private var teamModel: [PlantGrassTeamModel]?
    
    //选择的四个分类中的一个  二级分类
    private var elementModel: [SearchListModel]?
    private var cateGoryModel: [SquareModel]?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.loadData()
        
        self.buildBarButtonItem()
        
        self.view.setNeedsLayout()
        
    }

    
    func loadData(){
        teamModel = PlantGrassTeamModel.readTeamData()
        cateGoryModel = SquareModel.createSearchListModel()
        elementModel = cateGoryModel![0].elements
    }
    
    
    func buildBarButtonItem() {
        let nibs = NSBundle.mainBundle().loadNibNamed("MySegment", owner: nil, options: nil)
        if let sv = nibs[0] as? MySegment {
            segmentView = sv
        }
        self.navigationItem.titleView = segmentView
    }
    
    
    @IBAction func searchFriend(sender: UIBarButtonItem) {
        
    }
    
    @IBAction func addFriend(sender: UIBarButtonItem) {
        
    }
    
    
    // MARK: - MySegmentButtonClickProtocol
    
    func didCheckSquareButton() {
        
    }
    
    
    func didCheckInstrestButton() {
        
    }

    // MARK: - UICollectionViewDataSource
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("SquareCollectionViewCell", forIndexPath: indexPath)
        
        cell.backgroundColor = UIColor.orangeColor()
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        
        if kind == UICollectionElementKindSectionHeader{
            squareReusableHeadView = collectionView.dequeueReusableSupplementaryViewOfKind(UICollectionElementKindSectionHeader, withReuseIdentifier: "SquareCollectionReusableView", forIndexPath: indexPath) as! SquareCollectionReusableView
        }
        return squareReusableHeadView
        
    }
    
    
    // MARK: - UICollectionViewDelegate
    
    // MARK: - UIScrollViewDelegate
    
    var lastContentOffset = 0.0
    var needUp = false
    var needDown = true
    
//    let views = ["view": self.view]
    
    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        lastContentOffset = Double(scrollView.contentOffset.y)
        
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        if Double(scrollView.contentOffset.y) > (lastContentOffset ) {
            // up
            self.hideTabBar()
        }else {
            // down
            self.showTabBar()
        }
    }
    
    
    func hideTabBar(){
        guard needDown else{
            needUp = true
            return
        }
        needDown = false
        var frame = self.tabBarController!.tabBar.frame
        frame.origin.y += frame.size.height
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            self.tabBarController!.tabBar.frame = frame
            self.heightConstraint.constant += self.tabBarController!.tabBar.frame.size.height
            }) { (complete: Bool) -> Void in
                
        }
    }
    
    
    func showTabBar(){
        guard needUp else{
            needDown = true
            return
        }
        needUp = false
        var frame = self.tabBarController!.tabBar.frame
        frame.origin.y -= frame.size.height
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            self.tabBarController!.tabBar.frame = frame
            self.heightConstraint.constant -= self.tabBarController!.tabBar.frame.size.height
            }) { (complete: Bool) -> Void in
                
        }
    }
    
}
