//
//  testClass.swift
//  HongXue
//
//  Created by 王彦森 on 2017/9/29.
//  Copyright © 2017年 boxin. All rights reserved.
//

import UIKit

struct HXVideoData {
    
    
    var cutImg : String!
    var delFlag : Int!
    var endTime : Int!
    var flvUrl : String!
    var id : Int!
    var initImg : String!
    var keyword : String!
    var liveUrl : String!
    var m3u8Url : String!
    var mtsState : Int!
    var name : String!
    var onoff : Int!
    var ossObject : String!
    var playBackUrl : String!
    var playTimes : Int!
    var rtmpUrl : String!
    var shareTimes : Int!
    var startTime : Int!
    var streamName : String!
    var summary : String!
    var tId : Int!
    var teacherName : String!
    
    
    /**
     * 用字典来初始化一个实例并设置各个属性值
     */
    
    init(fromDictionary dictionary: NSDictionary){
        cutImg = dictionary["cutImg"] as? String
        delFlag = dictionary["delFlag"] as? Int
        endTime = dictionary["endTime"] as? Int
        flvUrl = dictionary["flvUrl"] as? String
        id = dictionary["id"] as? Int
        initImg = dictionary["initImg"] as? String
        keyword = dictionary["keyword"] as? String
        liveUrl = dictionary["liveUrl"] as? String
        m3u8Url = dictionary["m3u8Url"] as? String
        mtsState = dictionary["mtsState"] as? Int
        name = dictionary["name"] as? String
        onoff = dictionary["onoff"] as? Int
        ossObject = dictionary["ossObject"] as? String
        playBackUrl = dictionary["playBackUrl"] as? String
        playTimes = dictionary["playTimes"] as? Int
        rtmpUrl = dictionary["rtmpUrl"] as? String
        shareTimes = dictionary["shareTimes"] as? Int
        startTime = dictionary["startTime"] as? Int
        streamName = dictionary["streamName"] as? String
        summary = dictionary["summary"] as? String
        tId = dictionary["tId"] as? Int
        teacherName = dictionary["teacherName"] as? String
    }
}


