//
//  WBStatusViewModel.swift
//  ZJWeBoTest
//
//  Created by 邵泽俊 on 2017/2/28.
//  Copyright © 2017年 邵泽俊. All rights reserved.
/*
    单条微博的视图模型
 */

import Foundation

//如果没有任何父类 如果希望在开发中输出调试信息 需要准守 CustomStringConvertible 协议 ，实现description计算性属性
class WBStatusViewModel : CustomStringConvertible{
    
    var status: WBStatuses
    
    /// 构造函数
    /// - Parameter model: 微博模型
    
    init(model: WBStatuses) {
        
        self.status = model
    }
    
    var description: String{
        
        return status.description
    }
    
    
}
