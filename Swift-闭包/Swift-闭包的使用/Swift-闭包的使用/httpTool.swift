//
//  httpTool.swift
//  Swift-闭包的使用
//
//  Created by 邵泽俊 on 2016/11/26.
//  Copyright © 2016年 邵泽俊. All rights reserved.
//


import UIKit

class httpTool: NSObject {

    var callbackBlock :((_ jsonData:String)->())?
    
    //闭包类型 (参数列表) -> (返回值类型)
    func loadData(callBack : @escaping (_ jasonData:String) -> ()) -> Void {
//  self.callbackBlock = callBack
        callBack("后台返回的jason数据")
    }
}
