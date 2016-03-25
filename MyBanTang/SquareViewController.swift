//
//  SquareViewController.swift
//  MyBanTang
//
//  Created by snqu-ios on 16/3/22.
//  Copyright © 2016年 snqu-ios. All rights reserved.
//

import UIKit

class SquareViewController: UIViewController {
    
    private var segmentView: MySegment!
    
    // 各个分类显示的 collectionView
    private var showCollectionView: UICollectionView?
    
    // 种草小分队
    private var plantGrassTeamView: UICollectionView?
    
    
    //model
    private var teamModel: [PlantGrassTeamModel]?
    
    //选择的四个分类中的一个  二级分类
    private var elementModel: [SearchListModel]?
    private var cateGoryModel: [SquareModel]?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.loadData()
        
        self.buildBarButtonItem()
        
    }

    
    func loadData(){
        teamModel = PlantGrassTeamModel.readTeamData()
        cateGoryModel = SquareModel.createSearchListModel()
        elementModel = cateGoryModel![0].elements
    }
    
    
    func buildBarButtonItem() {
        let nibs = NSBundle.mainBundle().loadNibNamed("MySegment", owner: self, options: nil)
        if let sv = nibs[0] as? MySegment {
            segmentView = sv
        }
        self.navigationItem.titleView = segmentView
    }
    
    
    @IBAction func searchFriend(sender: UIBarButtonItem) {
    }
    
    @IBAction func addFriend(sender: UIBarButtonItem) {
    }
}
