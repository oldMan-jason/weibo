
//
//  procolable.swift
//  扩展构造器
//
//  Created by 邵泽俊 on 2017/7/1.
//  Copyright © 2017年 邵泽俊. All rights reserved.
//

import Foundation

protocol myprotocolfunction {
    
    var num : Int {
        get
    }
}

protocol  myprotocolfunction1 {
    
    func functionMine1() -> Void
}

protocol searchInArrayIndex {
    
}



protocol shareString {
    
//    func methodForOverride()
//    func methodWithOutOverride()
    
}


//协议的默认实现方法
extension shareString {
    
    func methodForOverride()
    {
        print("\(self)" + "协议帮忙实现 methodForOverride")
    }
    
    func methodWithOutOverride(){
        print("------")
        print("\(self)" + "协议帮忙实现 methodWithOutOverride")
        methodForOverride()
        print("------")
    }
}

