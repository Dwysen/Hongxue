//
//  HXNetwork.swift
//  HongXue
//
//  Created by 王彦森 on 2017/9/27.
//  Copyright © 2017年 boxin. All rights reserved.
//

//http://www.cctvjy.cn/info/categoriesbytype.do?typeId=1&page=1 需要登录的资讯借口

import UIKit
import Alamofire
import SwiftyJSON



class HXNetwork: NSObject {
    
    static let shareNetworkTool = HXNetwork()
    
    func loadBannerData(finished:@escaping (_ response:[URL]) -> ()){
        let url = URL(string: "http://www.cctvjy.cn/banner/list.do?size=4")
        let session = URLSession.shared
        var request = URLRequest(url: url!)
        request.httpMethod = "get"
        //        request.httpBody = "phone=\(phone)&pwd=\(pwd)&code=\(code)".data(using: String.Encoding.utf8)
        let task = session.dataTask(with: request) { (data, response, error) in
            if data != nil {
                
                let json = JSON(data:data!)
                let dataObject = json["data"].arrayValue
                //
                //                let responseObject = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! [String:Any]
                //                guard responseObject != nil else{
                //                    return
                //                }
                //                let dataObject = responseObject?["data"] as! [NSDictionary]
                var UrlArr = [URL]()
                
                for i in 0..<dataObject.count{
                    
                    let imgString = Common.baseUrl + (dataObject[i]["bannerUrl"].stringValue
                    )
                    let imgUrl = URL(string: imgString)
                    UrlArr.append(imgUrl!)
                }
                finished(UrlArr)
            }
            else {
                print("data == nil")
            }
        }
        task.resume()
    }
    
    func loadVideoData(finished:@escaping (_ videoArr: [HXVideoData]) -> ()){
        let url = URL(string: "http://www.cctvjy.cn/program/liveList.do")
        let session = URLSession.shared
        var request = URLRequest(url: url!)
        request.httpMethod = "get"
        //        request.httpBody = "phone=\(phone)&pwd=\(pwd)&code=\(code)".data(using: String.Encoding.utf8)
        let task = session.dataTask(with: request) { (data, response, error) in
            
            if data != nil {
                
                let json = JSON(data:data!)
                if let dataArr = json["data"].arrayObject{
                    var videoArr = [HXVideoData]()
                    for data in dataArr {
                        let hxVideo = HXVideoData(fromDictionary: data as! NSDictionary)
                        videoArr.append(hxVideo)
                    }
                    finished(videoArr)
                }
                
                let name = json["data"][0]["name"].stringValue
            }
            else {
                print("data == nil")
            }
        }
        task.resume()
    }
    
    
    
    func loadInformationData(finished:@escaping (_ informationArr: [HXInformationData]) -> ()){
        
        let url = URL(string:  "http://zixun.cctvjy.cn/zixunserver/index.php/news14/datacon/909/5/1")
        
        Alamofire.request(url!).responseString{ (response) in
            
            let whitespace = NSCharacterSet.whitespacesAndNewlines
            let str = response.result.value!.trimmingCharacters(in: whitespace)
            let index = str.index(str.endIndex, offsetBy: -1)
            let str2 = str.substring(to: index)
            let index2 = str.index(str2.startIndex, offsetBy: 1)
            let str3 = str2.substring(from:index2)
            
            let ecData = str3.data(using: String.Encoding.utf8)
            let dict = try! JSONSerialization.jsonObject(with: ecData!, options: .mutableContainers) as! NSDictionary
            let json = JSON(dict)
            
            if let dataArr = json["list"].arrayObject{
                var informationArr = [HXInformationData]()
                for data in dataArr {
                    let hxInformation = HXInformationData(fromDictionary: data as! NSDictionary)
                    informationArr.append(hxInformation)
                }
                finished(informationArr)
            }
            
        }
    }
    
    func loadBattleReviewData(finished:@escaping (_ informationArr: [HXBattleData]) -> ()){
        
        let url = URL(string:  "http://www.cctvjy.cn/review/list.do?index=1&size=5")
        
        Alamofire.request(url!).responseJSON{ (response) in
            
            if let value = response.result.value{
                
                let json = JSON(value)
        
                let dataArr = json["data"].arrayObject
                
                var BattleArr = [HXBattleData]()
                for data in dataArr! {
                    let battle = HXBattleData(fromDictionary: data as! NSDictionary)
                    BattleArr.append(battle)
                }
                finished(BattleArr)
            }
        }
    }
}
