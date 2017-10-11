//
//  OpenVideoCell.swift
//  HongXue
//
//  Created by 王彦森 on 2017/10/10.
//  Copyright © 2017年 boxin. All rights reserved.
//

import UIKit

class OpenVideoCell: UITableViewCell {

   
    private lazy var iconView : UIImageView = {
        let imgView = UIImageView(frame: CGRect(x: 15, y: (height - 15) / 2 , width: 20, height: 15 ))
        imgView.backgroundColor = Common.mainRed
        return imgView
        
    }()
    
    
    private lazy var titleLabel : UILabel = {
        let label = UILabel(frame: CGRect(x: 50, y: (height - 15) / 2, width: 100, height: 15))
        label.text = "直播列表"
        return label
        
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "cell")
        
        addSubview(iconView)

        addSubview(titleLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
