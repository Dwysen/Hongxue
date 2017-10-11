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
    
    func toDictionary() -> NSDictionary
    {
        var dictionary = NSMutableDictionary()
        if cutImg != nil{
            dictionary["cutImg"] = cutImg
        }
        if delFlag != nil{
            dictionary["delFlag"] = delFlag
        }
        if endTime != nil{
            dictionary["endTime"] = endTime
        }
        if flvUrl != nil{
            dictionary["flvUrl"] = flvUrl
        }
        if id != nil{
            dictionary["id"] = id
        }
        if initImg != nil{
            dictionary["initImg"] = initImg
        }
        if keyword != nil{
            dictionary["keyword"] = keyword
        }
        if liveUrl != nil{
            dictionary["liveUrl"] = liveUrl
        }
        if m3u8Url != nil{
            dictionary["m3u8Url"] = m3u8Url
        }
        if mtsState != nil{
            dictionary["mtsState"] = mtsState
        }
        if name != nil{
            dictionary["name"] = name
        }
        if onoff != nil{
            dictionary["onoff"] = onoff
        }
        if ossObject != nil{
            dictionary["ossObject"] = ossObject
        }
        if playBackUrl != nil{
            dictionary["playBackUrl"] = playBackUrl
        }
        if playTimes != nil{
            dictionary["playTimes"] = playTimes
        }
        if rtmpUrl != nil{
            dictionary["rtmpUrl"] = rtmpUrl
        }
        if shareTimes != nil{
            dictionary["shareTimes"] = shareTimes
        }
        if startTime != nil{
            dictionary["startTime"] = startTime
        }
        if streamName != nil{
            dictionary["streamName"] = streamName
        }
        if summary != nil{
            dictionary["summary"] = summary
        }
        if tId != nil{
            dictionary["tId"] = tId
        }
        if teacherName != nil{
            dictionary["teacherName"] = teacherName
        }
        return dictionary
    }

    
}


