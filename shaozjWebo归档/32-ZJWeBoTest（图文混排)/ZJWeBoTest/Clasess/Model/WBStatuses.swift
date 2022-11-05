//
//  WBStatuses.swift
//  ZJWeBoTest
//
//  Created by 邵泽俊 on 2017/2/7.
//  Copyright © 2017年 邵泽俊. All rights reserved.
/*
    总model
*/

import UIKit


/// 使用YYModel
import YYModel

class WBStatuses: NSObject {

    var id: Int64 = 0
    var text : String?
    
    var created_at: String?
    var source : String?
    
    
    var reposts_count :Int = 0	  // int 转发数
    var comments_count :Int = 0	  // int	评论数
    var attitudes_count :Int = 0 // 表态数
    
    // 微博的用户model
    var user : WBHomeModel?
    
    //微博配图视图的model   通过key 获取的是一个 字典类型的数组 需要告诉第三方 实现 modelContainerPropertyGenericClass 方法
    var pic_urls : [WBHomePicture]?
    
    //被转发的原创微博
    var retweeted_status :WBStatuses?
    
    //重写 description的计算型属性
    override var description: String{
        
        return yy_modelDescription()
    }
    
    //直接将 数组转化成 WBHomePicture 模型对象 
    // 告诉第三方框架 如果遇到数组类型的属性，数组中存放的对象是什么类？
    
    class func modelContainerPropertyGenericClass() -> [String : AnyClass] {
        return ["pic_urls": WBHomePicture.self]
    }
    
    
}


