//
//  VideoView.swift
//  HongXue
//
//  Created by 王彦森 on 2017/9/29.
//  Copyright © 2017年 boxin. All rights reserved.
//

import UIKit

class BattleReviewViewController: UIViewController {
    
    
    var collectionView:UICollectionView!
    var battleArr:[HXBattleData]?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.height = Common.videoViewHeight
//        view.backgroundColor = UIColor.brown
        
        weak var weakSelf = self
        
        HXNetwork.shareNetworkTool.loadBattleReviewData (index: 1) { (battleArr) in
            
            DispatchQueue.main.async {
            
                weakSelf?.battleArr = battleArr
                weakSelf!.setupCollectionView()
            }
        }
    }
    
    private func setupCollectionView(){
        
        let titleView = TitleView(frame: CGRect(x: 0, y: 0, width: Common.screenWidth, height: Common
            .titleViewHeight))
        titleView.viewTitleLabel.text = "战绩回顾"
        titleView.viewSubTitleLabel.text = "查看近期直播视频"
        view.addSubview(titleView)
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        collectionView = UICollectionView(frame: CGRect(x: 0, y: Common.titleViewHeight, width: Common.screenWidth, height: 108), collectionViewLayout: flowLayout)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = UIColor.white
        collectionView.register(BattleCell.self, forCellWithReuseIdentifier: "cell")
        view.addSubview(collectionView)
        
    }
    
}

extension BattleReviewViewController:UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (battleArr?.count)!
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! BattleCell
        cell.battle = battleArr![indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 170, height: 108)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
}

