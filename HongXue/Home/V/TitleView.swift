//
//  titleView.swift
//  HongXue
//
//  Created by 王彦森 on 2017/10/8.
//  Copyright © 2017年 boxin. All rights reserved.
//

import UIKit

class TitleView: UIView {

    private lazy var viewTitleLabel:UILabel = {
        let label = UILabel(frame: CGRect(x: Common.tenPxMargin, y: Common.titleMargin , width:300, height: 20))
        label.text = "视频"
        //        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 22)
        return label
        
    }()
    
    private lazy var viewSubTitleLabel:UILabel = {
        let label = UILabel(frame: CGRect(x:Common.tenPxMargin , y: viewTitleLabel.maxY + Common.tenPxMargin , width:300, height: 20))
        label.text = "你成功学习的第一步"
        label.textColor = UIColor.init(red: 75/255, green: 75/255, blue: 75/255, alpha: 1)
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
