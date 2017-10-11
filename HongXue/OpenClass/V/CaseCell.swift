//
//  CaseCell.swift
//  HongXue
//
//  Created by 王彦森 on 2017/10/10.
//  Copyright © 2017年 boxin. All rights reserved.
//

import UIKit

class CaseCell: UITableViewCell {
    
    var battleData:HXBattleData?{
        didSet{
            
            
            let str = Common.baseUrl + battleData!.reviewUrl
            imgView.kf.setImage(with: URL(string: str))
            
        }
        
    }

    private lazy var imgView : UIImageView = {
        let imgView = UIImageView(frame: CGRect(x: 0, y: 0, width: width, height: height))
        return imgView
        
        
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.frame = CGRect(x: 0, y: 0, width: Common.screenWidth, height: Common.screenWidth / 2)
        addSubview(imgView)

 
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    override func awakeFromNib() {
//
//        super.awakeFromNib()
//
//    }

//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }

}
