//
//  SingleInformationView.swift
//  HongXue
//
//  Created by 王彦森 on 2017/10/8.
//  Copyright © 2017年 boxin. All rights reserved.
//

import UIKit

class SingleInformationView: UIView {

    private lazy var viewTitleLabel:UILabel = {
        let label = UILabel(frame: CGRect(x: Common.tenPxMargin, y: 15 , width:Common.screenWidth - 20, height: 45))
        label.text = "今日最新消息 次新股活跃煤炭股低迷。今日最新消息 次新股活跃煤炭股低迷。今日最新消息 次新股活跃煤炭股低迷。"
        //        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 22)
        return label
        
    }()
    
    private lazy var sourceLabel:UILabel = {
        let label = UILabel(frame: CGRect(x: Common.tenPxMargin, y: viewTitleLabel.maxY + 5 , width:100, height: 15))
        label.text = "红雪官方教育中心。"
        //        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 15)
        return label
        
    }()
    
    private lazy var timeLabel:UILabel = {
        let label = UILabel(frame: CGRect(x: Common.tenPxMargin + 105, y: viewTitleLabel.maxY + 5 , width:100, height: 15))
        label.text = "2017-9-4。"
        //        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 15)
        return label
        
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        addSubview(viewTitleLabel)
        
        addSubview(sourceLabel)
        
        addSubview(timeLabel)
        
        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
