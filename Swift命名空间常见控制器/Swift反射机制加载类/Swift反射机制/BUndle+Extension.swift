//
//  BUndle+Extension.swift
//  Swift反射机制
//
//  Created by 邵泽俊 on 2017/1/16.
//  Copyright © 2017年 邵泽俊. All rights reserved.
//

import Foundation

extension Bundle{
    
    func nameSpace() -> String {
        
//        return Bundle.main.infoDictionary?["CFBundleName"] as? String ?? ""
          return infoDictionary?["CFBundleName"] as? String ?? ""
    
    }
    
    //利用计算型属性 类似于函数 没有参数 只有返回值
    var namespace : String{
        
        return infoDictionary?["CFBundleName"] as? String ?? ""
    }
    
    
    
}
