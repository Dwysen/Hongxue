//
//  testClass.swift
//  HongXue
//
//  Created by 王彦森 on 2017/9/29.
//  Copyright © 2017年 boxin. All rights reserved.
//

import UIKit

struct HXInformationData {
    
    var title : String!
    var time:String!
    var sourse:String!
    
    
    
    /**
     * 用字典来初始化一个实例并设置各个属性值
     */
    
    init(fromDictionary dictionary: NSDictionary){
        title = dictionary["title"] as? String
        sourse = dictionary["glid"] as? String
        time = dictionary["createtime"] as? String
        
    }
}



