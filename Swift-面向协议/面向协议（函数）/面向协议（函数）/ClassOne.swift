//
//  ClassOne.swift
//  面向协议（函数）
//
//  Created by 邵泽俊 on 2017/9/26.
//  Copyright © 2017年 邵泽俊. All rights reserved.
//

import UIKit

class ClassOne: classb {
    
    var nn : String?
    
    
    var marks = 96
    let result = true
    var present = false
    var subject = "Swift 协议"
    var stname = "Protocols"
    
    func attendance() -> String {
        return "kk"
//        return "The \() has secured 99% attendance"
    }
    
    func markssecured() -> String {
        return  "ss" //"\("ee") has scored \(marks)"
    }
    
    
}
