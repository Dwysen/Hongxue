//
//  VideoView.swift
//  HongXue
//
//  Created by 王彦森 on 2017/9/29.
//  Copyright © 2017年 boxin. All rights reserved.
//

import UIKit

class VideoViewController: UIViewController {
    
    
    var collectionView:UICollectionView!
    var videoArr:[HXVideoData]?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.height = Common.videoViewHeight
        view.backgroundColor = UIColor.cyan
        
        weak var weakSelf = self
        HXNetwork.shareNetworkTool.loadVideoData { (videoArr) in
         
            
            print(videoArr)
            
              // TO DO
//              print(videoArr[0].name)
//              print(videoArr[1].name)
//              print(videoArr[2].name)
//              print(videoArr[3].name)
        
            
            DispatchQueue.main.async {
                
                weakSelf?.videoArr = videoArr
                weakSelf!.setupCollectionView()
            }
        }
    }
    
    private func setupCollectionView(){
    
        let titleView = TitleView(frame: CGRect(x: 0, y: 0, width: Common.screenWidth, height: Common
        .titleViewHeight))
        view.addSubview(titleView)
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        collectionView = UICollectionView(frame: CGRect(x: 0, y: Common.titleViewHeight, width: Common.screenWidth, height: 108), collectionViewLayout: flowLayout)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = UIColor.white
        collectionView.register(VideoCell.self, forCellWithReuseIdentifier: "cell")
        view.addSubview(collectionView)
        
    }
    
}

extension VideoViewController:UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (videoArr?.count)!
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! VideoCell
        cell.video = videoArr?[indexPath.item]
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 170, height: 108)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
}
