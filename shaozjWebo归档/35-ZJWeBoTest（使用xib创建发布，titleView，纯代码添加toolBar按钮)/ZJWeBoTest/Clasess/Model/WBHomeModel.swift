//
//  WBHomeModel.swift
import UIKit
/// 使用YYModel
import YYModel

class WBHomeModel: NSObject {

    // 注意 基本数据类型 & private 不能使用 KVC 设置
    var id : Int = 0
    //用户名
    var screen_name: String?
    //用户头像
    var profile_image_url : String?
    //认证类型   -1：没有认证 0： 认证用户
    var verified_type : Int = 0
    // 会员等级 （0-6）
    var mbrank: Int = 0
    
    
    //重写 description的计算型属性
    override var description: String{
//        print(yy_modelDescription())
        
        return yy_modelDescription()
    }

}
