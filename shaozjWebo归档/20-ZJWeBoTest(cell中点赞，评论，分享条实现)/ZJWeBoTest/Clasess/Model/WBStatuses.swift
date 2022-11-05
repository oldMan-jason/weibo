//
//  WBStatuses.swift
//  ZJWeBoTest
//
//  Created by 邵泽俊 on 2017/2/7.
//  Copyright © 2017年 邵泽俊. All rights reserved.
//

import UIKit


/// 使用YYModel
import YYModel

class WBStatuses: NSObject {

    var id: Int64 = 0
    var text : String?
    var reposts_count :Int = 0	  // int 转发数
    var comments_count :Int = 0	  // int	评论数
    var attitudes_count :Int = 0 // 表态数
    
    
    // 微博的用户model
    var user : WBHomeModel?

    //重写 description的计算型属性
    override var description: String{
        
        print(yy_modelDescription())
        
        return yy_modelDescription()
    }
    
    
    
}


