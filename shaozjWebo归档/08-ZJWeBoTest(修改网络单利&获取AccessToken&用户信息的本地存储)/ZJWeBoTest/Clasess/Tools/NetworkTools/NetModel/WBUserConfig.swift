//
//  WBUserConfig.swift
//  ZJWeBoTest
//
//  Created by 邵泽俊 on 2017/2/10.
//  Copyright © 2017年 邵泽俊. All rights reserved.
//

import UIKit

/// 用户账户信息
class WBUserConfig: NSObject {
    
    //访问令牌
    var access_token :String? //= "2.00R87bPGR_xVnDe6427f7a9ccVskOD"
    
    //用户代号
    var uid: String?
    
    //accesstoken的生命周期
    var expires_in : TimeInterval = 0{
        didSet{
            expiresData = Date(timeIntervalSinceNow: expires_in)
        }
    }
    //过期日期
    var expiresData : Date?
    
    
    override init() {
        super.init()
        let fileName = "userConfig.json"
        let SHPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        let file = (SHPath as NSString).appendingPathComponent(fileName)
        print(file)
        //从磁盘中加载文件到 二进制数据，如果失败直接返回
        guard let data = NSData(contentsOfFile: file),let dict = try? JSONSerialization.jsonObject(with: data as Data, options: []) as? [String: AnyObject] else{
            return
        }
        // 使用字典设置属性值
        yy_modelSet(withJSON: dict ?? [:])
    }
    
    override var description: String{
        return yy_modelDescription()
    }
}

extension WBUserConfig{
    
    //此时 userconfig中 已经有属性的值
    func saveUserConfig() -> Void {
    
        //1>  模型需要转化成字典 [String : Any]?
        var dict = self.yy_modelToJSONObject() as? [String: AnyObject] ?? [:]
        //需要删除 expires_in 值
        dict.removeValue(forKey: "expires_in")
        
        //2> 字典序列化为data
        guard let data = try? JSONSerialization.data(withJSONObject: dict, options: []) else{
            return
        }
        
        //3> 写入磁盘
          // a) 文件名字
        let fileName = "userConfig.json"
          // b) 获取沙盒路径
        let SHPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
          // c) 文件路径拼接
        let file = (SHPath as NSString).appendingPathComponent(fileName)
          // d)写入磁盘
        (data as NSData).write(toFile: file, atomically: true)
        
        print("文件路径--\(file)")
        
    }
}
