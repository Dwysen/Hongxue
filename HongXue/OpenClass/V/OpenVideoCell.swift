//
//  OpenVideoCell.swift
//  HongXue
//
//  Created by 王彦森 on 2017/10/10.
//  Copyright © 2017年 boxin. All rights reserved.
//

import UIKit

class OpenVideoCell: UITableViewCell {

   
    var videoData:NSDictionary!{
        
        didSet{
            titleLabel.text = videoData["name"] as? String
            
            let startTime = videoData["startTime"] as! Int
            let endTime = videoData["endTime"] as! Int
            
            timeLabel.text = "\(timeStampToString(timeStamp: startTime))~\(timeStampToString(timeStamp: endTime))"
            
         
//            let test = String( describing: videoData["startTime"] )
            let intTest = videoData["startTime"] as! Int
            let res = timeStampToString(timeStamp: intTest)
            print(res)
//            print(timeStampToString(timeStamp: test ))
   
            
        }
        
    }
    
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
    
    private lazy var timeLabel : UILabel = {
        let label = UILabel(frame: CGRect(x: Common.screenWidth - 110, y: (height - 15) / 2, width: 100, height: 15))
        label.font = UIFont.systemFont(ofSize: 10)
        label.text = "直播列表"
        
        return label
        
    }()
    
     func timeStampToString(timeStamp:Int)->String {
        
        let timeInterVal = TimeInterval.init(timeStamp)
        let date = Date(timeIntervalSince1970: timeInterVal)
        
        let dfmatter = DateFormatter()
        dfmatter.dateFormat="HH:mm"
        
        let time = dfmatter.string(from: date)
        return time
        
    }
    

    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "cell")
        
        addSubview(iconView)

        addSubview(titleLabel)
        
        addSubview(timeLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
