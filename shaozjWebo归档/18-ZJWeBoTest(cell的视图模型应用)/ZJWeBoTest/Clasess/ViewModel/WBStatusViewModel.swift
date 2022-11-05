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
import UIKit

//如果没有任何父类 如果希望在开发中输出调试信息 需要准守 CustomStringConvertible 协议 ，实现description计算性属性
class WBStatusViewModel : CustomStringConvertible{
    
    var status: WBStatuses
    
    //可以在这里设置 会员图标
    var vipIcon : UIImage?
    
    //设置认证图标 verified_type
    var verified_type: UIImage?
    
    /// 构造函数
    /// - Parameter model: 微博模型
    
    init(model: WBStatuses) {
        
        self.status = model
        //设置会员的等级
        if (model.user?.mbrank)! > 0 && (model.user?.mbrank)! < 7 {
            
            let imgName = "common_icon_membership_level" + "\(model.user?.mbrank ?? 1)"
            
            self.vipIcon = UIImage(named: imgName)
            
        }
        
        //设置认证的图标
        switch model.user?.verified_type ?? -1 {
        case 0:
            verified_type = UIImage(named: "avatar_vip")
        case 2,3,5:
            verified_type = UIImage(named: "avatar_enterprise_vip")
        case 220:
            verified_type = UIImage(named: "avatar_grassroot")
            
        default:
            break
        }
        
        
    }
    
    var description: String{
        
        return status.description
    }
    
    
}
