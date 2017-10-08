//
//  BannerCell.swift
//  HongXue
//
//  Created by 王彦森 on 2017/9/27.
//  Copyright © 2017年 boxin. All rights reserved.
//

import UIKit
import Kingfisher

class BannerCell: UICollectionViewCell {
    
    var imgView:UIImageView!
    var url:URL!{
        
        didSet{
            imgView.kf.setImage(with: url)
        }
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        imgView = UIImageView(frame: CGRect(x: 0, y: 0, width: width , height: height))
        
        imgView.backgroundColor = UIColor.red
        
        self.addSubview(imgView)
        
        
        
    
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
