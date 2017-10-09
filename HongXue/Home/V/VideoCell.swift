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
        
        let titleLabel = UILabel(frame: CGRect(x: 10, y: height - 25 , width: 80, height: 20))
        titleLabel.font = UIFont.systemFont(ofSize: 14)
        titleLabel.textColor = UIColor.white
        return titleLabel
        
    }()
    
    private lazy var teacherLabel:UILabel = {
        
        let teacherLabel = UILabel(frame: CGRect(x: width - 50, y: height - 25 , width: 50, height: 20))
        teacherLabel.font = UIFont.systemFont(ofSize: 14)
        teacherLabel.textColor = UIColor.white
        return teacherLabel
        
    }()
    
    var video:HXVideoData?{
        didSet {
            titleLabel.text = video?.name
            teacherLabel.text = video?.teacherName
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.blue
        addSubview(titleLabel)
        addSubview(teacherLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
