//
//  titleView.swift
//  HongXue
//
//  Created by 王彦森 on 2017/10/8.
//  Copyright © 2017年 boxin. All rights reserved.
//

import UIKit

class TitleView: UIView {

    lazy var viewTitleLabel:UILabel = {
        let label = UILabel(frame: CGRect(x: Common.tenPxMargin, y: Common.titleMargin , width:300, height: 20))
        label.text = "视频"
        //        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 22)
        return label
        
    }()
    
     lazy var viewSubTitleLabel:UILabel = {
        let label = UILabel(frame: CGRect(x:Common.tenPxMargin , y: viewTitleLabel.maxY + Common.tenPxMargin , width:300, height: 20))
        label.text = "你成功学习的第一步"
        label.textColor = Common.subTitleGray
        label.font = UIFont.systemFont(ofSize: 15)
        
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(viewTitleLabel)
        
        addSubview(viewSubTitleLabel)
        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
