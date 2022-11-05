//
//  String+Extension.swift
//  正则表达式练习
//
//  Created by 邵泽俊 on 2017/3/15.
//  Copyright © 2017年 邵泽俊. All rights reserved.
//

import Foundation

extension String{
    
    /// - Returns: 采用元组的方式 进行返回所得数据
    func zj_regx() -> (link: String,text: String)? {
        
        let pattern = "<a href=\"(.*?)\" rel=\"nofollow\">(.*?)</a>"
        
        guard let regx = try? NSRegularExpression(pattern: pattern, options: []) else{
            return nil
        }
        
        guard let result = regx.firstMatch(in: self, options: [], range: NSRange(location: 0, length: characters.count)) else{
            print("没有匹配结果")
            return nil
        }
//        for index in 0..<result.numberOfRanges {
//            let r = result.rangeAt(index)
//            let checkStr = (self as NSString).substring(with: r)
//            print(checkStr)
//            return ()
//        }
        let link = (self as NSString).substring(with: result.rangeAt(1))
        let textCome = (self as NSString).substring(with: result.rangeAt(2))
        
        return (link,textCome)
        
    }
}
