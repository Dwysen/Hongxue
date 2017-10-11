//
//  VideoCell.swift
//  HongXue
//
//  Created by 王彦森 on 2017/9/29.
//  Copyright © 2017年 boxin. All rights reserved.
//

import UIKit

class BattleCell: UICollectionViewCell {
    
    
    private lazy var imageView:UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: width
            , height: height))
        return imageView
        
    }()
    
    private lazy var titleLabel:UILabel = {
        
        let titleLabel = UILabel(frame: CGRect(x: 10, y: height - 25 , width: 80, height: 20))
        titleLabel.font = UIFont.systemFont(ofSize: 14)
        titleLabel.textColor = UIColor.white
        return titleLabel
        
    }()
    
    private lazy var timeLabel:UILabel = {
        
        let timeLabel = UILabel(frame: CGRect(x: width - 50, y: height - 25 , width: 50, height: 20))
        timeLabel.font = UIFont.systemFont(ofSize: 14)
        timeLabel.textColor = UIColor.white
        return timeLabel
        
    }()
    
    var battle:HXBattleData?{
        didSet {
            titleLabel.text = battle?.descriptionField

            timeLabel.text = "\(String(describing: battle?.createTime))"
            
            let str = Common.baseUrl + battle!.reviewUrl
            imageView.kf.setImage(with: URL(string: str))

        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.blue
        addSubview(imageView)
        imageView.addSubview(titleLabel)
        imageView.addSubview(timeLabel)
   
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

