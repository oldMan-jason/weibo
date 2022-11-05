//
//  WBNetworkManager+Extension.swift
//  ZJWeBoTest
//
//  Created by 邵泽俊 on 2017/2/1.
//  Copyright © 2017年 邵泽俊. All rights reserved.
//

import Foundation

// MARK:- 封装网络请求方法  token封装
extension WBNetworkManager{
    
    //completion  完成回调的一个闭包：(list: [[String : Any]], isSucess: Bool)->()
    //若指定此参数，则返回ID比since_id大的微博（即比since_id时间晚的微博），默认为0
    //若指定此参数，则返回ID小于或等于max_id的微博，默认为0
    
    func statusList(since_id: Int64 = 0, max_id: Int64 = 0,completion: @escaping (_ list: [[String : Any]]?, _ isSucess: Bool)->()) -> Void {
        
        let urlstr = "https://api.weibo.com/2/statuses/home_timeline.json"
        // 在Swift中  Int 可以转化成 Any 但是
        let parmers = ["since_id":since_id,
                       "max_id":(max_id > 0) ? (max_id - 1) : 0  ]
        
        //在内部进行 token的拼接
        requestToken(urlString: urlstr, parmers: parmers) { (jsonBackData, isSucess) in
        
           let reslut = (jsonBackData as? [String : Any])?["statuses"]
            
           completion(reslut as! [[String : Any]]?, isSucess)
            
        }
    }
    
}
