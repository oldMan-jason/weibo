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
    
    //设置 分享
    var repostsStr : String?
    
    //设置 评论
    var commentsStr: String?
    
    //设置 点赞
    var attitudesStr: String?
    
    //配图视图的大小
    var pictureSize = CGSize()
    
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
//        model.reposts_count = Int(arc4random_uniform(1000000))
        repostsStr = countString(count: model.reposts_count, defaultStr: "转发")
        commentsStr = countString(count: model.comments_count, defaultStr: "评论")
        attitudesStr = countString(count: model.attitudes_count, defaultStr: "点赞")
        
        //设置配图视图的大小
       pictureSize = calculatePictureSize(count: model.pic_urls?.count)
    
    }
    
    //计算配图里面的小图大小
    func calculatePictureSize(count: Int?) -> CGSize {
        if count == 0 {
            return CGSize()
        }
        //每一个item的高度
          // 1> 根据count计算 行数
        let row = ( count! - 1) / 3 + 1
          // 2> 根据行数计算配图的高度
        let height = wbstatusPictureOutterMargin * 2  + CGFloat(row) * wbstatusPictureItemWidth + CGFloat(row - 1) * wbstatusPictureInnerMatgin

        return CGSize(width: wbstatusPictureWidth, height: height)
    }
    
    //设置 cell底部的工具条 数字计算方法
    func countString(count: Int,defaultStr: String) -> String {
        
        if count == 0 {
            return defaultStr
        }
        if count < 10000 {
            return count.description
        }
         return String(format:"%.02f 万",Double(count) / 10000)
    }
    
    var description: String{
        
        return status.description
    }
    
    
}
