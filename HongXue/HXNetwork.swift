//
//  HXNetwork.swift
//  HongXue
//
//  Created by 王彦森 on 2017/9/27.
//  Copyright © 2017年 boxin. All rights reserved.
//

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
                        
                        print(videoArr)
                        
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
    
    
}
