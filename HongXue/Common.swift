//
//  Common.swift
//  HongXue
//
//  Created by 王彦森 on 2017/9/28.
//  Copyright © 2017年 boxin. All rights reserved.
//

import UIKit
struct Common {
    static let screenWidth = UIScreen.main.bounds.size.width
    static let screenHeight = UIScreen.main.bounds.size.height
    static let baseUrl:String = "http://www.cctvjy.cn"
    static let e51c24 = UIColor.init(red: 229/255, green: 36/255, blue: 28/255, alpha: 1)
    static let tenPxMargin:CGFloat = 10.0
    static let titleMargin:CGFloat = 36.0
    static let titleHeight:CGFloat = 20
    static let navigationHeight:CGFloat =  64.0
    static let videoViewHeight:CGFloat = 215
    static let informationViewHeight:CGFloat = 1200
    
    static let titleViewHeight:CGFloat = Common.titleMargin + Common.titleHeight + Common.tenPxMargin + Common.titleHeight + 20
    
}

