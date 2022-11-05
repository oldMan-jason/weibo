//
//  WBNetworkManager+Extension.swift
//  ZJWeBoTest
//
//  Created by 邵泽俊 on 2017/2/1.
//  Copyright © 2017年 邵泽俊. All rights reserved.
//

import Foundation
import UIKit

// MARK:- 封装网络请求方法  token封装
extension WBNetworkManager{
    
    //completion  完成回调的一个闭包：(list: [[String : Any]], isSucess: Bool)->()
    //若指定此参数，则返回ID比since_id大的微博（即比since_id时间晚的微博），默认为0
    //若指定此参数，则返回ID小于或等于max_id的微博，默认为0
    
    func statusList(since_id: Int64 = 0, max_id: Int64 = 0,completion: @escaping (_ list: [[String : Any]]?, _ isSucess: Bool)->()) -> Void {
        
        let urlstr = "https://api.weibo.com/2/statuses/home_timeline.json"
        
        let parmers = ["since_id":since_id,
                       "max_id":(max_id > 0) ? (max_id - 1) : 0  ]
        
        //在内部进行 token的拼接
        requestToken(urlString: urlstr, parmers: parmers) { (jsonBackData, isSucess) in
        
           let reslut = (jsonBackData as? [String : Any])?["statuses"]
            
           completion(reslut as! [[String : Any]]?, isSucess)
            
        }
    }
    
    //返回微博未读数
    func unReadCount(completion:@escaping ( _ count: Int)->()) -> Void {
        
        let urlStr = "https://rm.api.weibo.com/2/remind/unread_count.json"
        
        guard let uid = userConfig.uid else {
            return
        }
        let parmers = ["uid":uid]
        
        requestToken(urlString: urlStr, parmers: parmers) { (json, isSucess) in
        
            let dict = json as? [String : Any]
            let count = dict?["status"] as? Int
//          print(json)
            print("未读微博的数量为\(count)条")
            completion(count ?? 0)
            
        }
    }
}

// MARK:- 请求AccessToken
extension WBNetworkManager{
    
    func loadAccessToken(code: String,completion:@escaping (_ isSucess: Bool)->()) -> Void {
        
        let accessUrl = "https://api.weibo.com/oauth2/access_token"
        
        let parmers = ["client_id":WBAPPKEY,
                       "client_secret":WBAPPSecret,
                       "grant_type":"authorization_code",
                       "code":code,
                       "redirect_uri":WBRedirectURL
                       ]
        //发起网络请求
       request(requestMothed: .POST, urlString: accessUrl, parmers: parmers) { (json, isSucess) in
        /*
         Optional({
         "access_token" = "2.00R87bPGR_xVnDe6427f7a9ccVskOD";
         "expires_in" = 157679999;
         "remind_in" = 157679999;
         uid = 5727361803;
         })
         */
        //通过字典 --> 模型设置值 设置accesstoken 和过期日期
        self.userConfig.yy_modelSet(with: (json as? [String: Any]) ?? [:])
       
        //加载用户信息
        self.loadUserMessage(completion: { (userMessage) in
            print(userMessage)
            
            //设置 新增的 用户昵称 和 头像
            self.userConfig.yy_modelSet(with: userMessage)
            
            //存储用户配置信息
            self.userConfig.saveUserConfig()
            
            print(self.userConfig)
            
            //加载完成用户信息之后 在回调
            completion(isSucess)
        })
        }
    }
}

// MARK:- 用户信息
extension WBNetworkManager{
    
    func loadUserMessage(completion:@escaping ( _ dict:[String: AnyObject])->()) -> Void {
        
        let url  = "https://api.weibo.com/2/users/show.json"
        guard let uid = userConfig.uid else {
            return
        }
        let parmas = ["uid":uid]
        
        requestToken(urlString: url, parmers: parmas) { (json, isSucess) in
            
            completion((json as? [String : AnyObject]) ?? [:])
            
        }
    }
}

// MARK:- 文件上传
extension WBNetworkManager{
    
    func postStatus(text: String,image: UIImage?,completion:@escaping (_ result:[String: AnyObject]?,_ isSucess: Bool)->()) -> Void {
        
        let urlString : String
        //1 根据是否有图片 选择调用的接口
        if image == nil {//发布一条微博信息
            urlString = "https://api.weibo.com/2/statuses/update.json"
        }else{//发送图片和微博文字
            urlString = "https://upload.api.weibo.com/2/statuses/upload.json"
        }
        
        //2 拼接文件字典
        let parmas = ["status": text]
        
        //3 如果图像不为空 需要设置 name和data
        var name : String?
        var data : NSData?
        
        if image != nil {
            name = "pic"
            data = UIImagePNGRepresentation(image!) as NSData?
        }
        
            requestToken(requestMothed: .POST, urlString: urlString, parmers: parmas, name: name, data: data) { (json, isSucess) in
                
               completion(json as! [String : AnyObject]?, isSucess)
                
        }
    
    }

}

