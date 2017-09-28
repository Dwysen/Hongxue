//
//  HXNetwork.swift
//  HongXue
//
//  Created by 王彦森 on 2017/9/27.
//  Copyright © 2017年 boxin. All rights reserved.
//

import UIKit
import Alamofire

class HXNetwork: NSObject {
    
    class func RegisterWithURLSession(finished:@escaping (_ response:[URL]) -> ()){
        let url = URL(string: "http://www.cctvjy.cn/banner/list.do?size=4")
        
        let session = URLSession.shared
        var request = URLRequest(url: url!)
        request.httpMethod = "get"
//        request.httpBody = "phone=\(phone)&pwd=\(pwd)&code=\(code)".data(using: String.Encoding.utf8)
        let task = session.dataTask(with: request) { (data, response, error) in
            if data != nil {
                print(data!)
                
                let responseObject = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! [String:Any]
                guard responseObject != nil else{
                    return
                }
                
                let dataObject = responseObject?["data"] as! [NSDictionary]
                    print(dataObject)
                
                var UrlArr = [URL]()
                
                for i in 0..<dataObject.count{
                
                    print(i)
                    let imgString = Common.baseUrl + (dataObject[i]["bannerUrl"] as! String)
                    let imgUrl = URL(string: imgString)
//                    let imgData =  NSData(contentsOf: imgUrl!)
//                    let image = UIImage(data: imgData! as Data)
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

}
