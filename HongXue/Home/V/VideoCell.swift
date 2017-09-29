//
//  VideoCell.swift
//  HongXue
//
//  Created by 王彦森 on 2017/9/29.
//  Copyright © 2017年 boxin. All rights reserved.
//

import UIKit

class VideoCell: UICollectionViewCell {
    
    private lazy var titleLabel:UILabel = {
        
        let titleLabel = UILabel(frame: CGRect(x: 10, y: 10, width: width - 20, height: 20))
        return titleLabel
        
    }()
    
    var video:HXVideoData?{
        didSet {
            titleLabel.text = video?.name
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.blue
        addSubview(titleLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
