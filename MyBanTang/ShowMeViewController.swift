//
//  ShowMeViewController.swift
//  MyBanTang
//
//  Created by snqu-ios on 16/3/28.
//  Copyright © 2016年 snqu-ios. All rights reserved.
//

import UIKit

import Photos
import AssetsLibrary


class ShowMeViewController: UIViewController {
    
    
    private var currentPhotoData: PHFetchResult?
    
    private var imageManger: PHCachingImageManager?
    
    private var showCollectionView: UICollectionView?
    
    
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
            completeButtomItem = UIBarButtonItem.init(title: rightTitle, style: .Done, target: self, action: "completeAction")
            navigationItem.rightBarButtonItem = completeButtomItem
        }
        completeButtomItem.tintColor = UIColor.whiteColor()
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.readImagesFromPhone()
        
        self.buildCollectionView()
    }
    
    
    
    func readImagesFromPhone() {
        //
        let smartAlbums = PHAssetCollection.fetchAssetCollectionsWithType(.SmartAlbum, subtype: .AlbumRegular, options: nil)
        imageManger = PHCachingImageManager()
        let options = PHFetchOptions()
        options.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: true)]
        
        for var i = 0 ; i < smartAlbums.count; i++ {
            if smartAlbums[i].localizedTitle == "相机胶卷" || smartAlbums[i].localizedTitle == "Camera Roll" {
                currentPhotoData = PHAsset.fetchAssetsInAssetCollection(smartAlbums[i] as! PHAssetCollection, options: options)
            }
        }
    }
    
    
    func buildCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .Vertical
        layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0)
        layout.minimumInteritemSpacing = 2
        layout.minimumLineSpacing = 4
        
        showCollectionView = UICollectionView(frame: CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 64), collectionViewLayout: layout)
        showCollectionView?.backgroundColor = UIColor.whiteColor()
        showCollectionView?.registerClass(ShowMeCollectionViewCell.self, forCellWithReuseIdentifier: "ShowMeCollectionViewCell")
        showCollectionView?.delegate = self
        showCollectionView?.dataSource = self
        showCollectionView?.alwaysBounceVertical = true
        
        self.view.addSubview(showCollectionView!)
        
    }
    
    
    func barCancel() {
        navigationController?.dismissViewControllerAnimated(true, completion: nil)
        navigationController?.popViewControllerAnimated(true)
    }
    
    func completeAction() {
        self.navigationController?.dismissViewControllerAnimated(true, completion: nil)
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}



extension ShowMeViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    // MARK: - UICollectionViewDataSource
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if currentPhotoData != nil && currentPhotoData?.count > 0 {
            return currentPhotoData!.count + 1
        }
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("ShowMeCollectionViewCell", forIndexPath: indexPath) as! ShowMeCollectionViewCell
        if indexPath.row == 0 {
            cell.configCellImage(nil)
        }else {
            // 注意这里不是异步的 会阻塞主线程
            let assets = currentPhotoData![indexPath.row - 1] as! PHAsset
            imageManger!.requestImageForAsset(assets, targetSize: CGSizeMake(103, 103), contentMode: .AspectFill, options: nil, resultHandler: { (image, array) -> Void in
                cell.configCellImage(image)
            })
        }
        
        return cell
    }
    
    
    // MARK: - UICollectionViewDataSource
    
    // MARK: - UICollectionViewDelegateFlowLayout
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(103, 103)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(2, 2, 2, 2)
    }
}