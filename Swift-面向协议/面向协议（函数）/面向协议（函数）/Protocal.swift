//
//  Protocal.swift
//  面向协议（函数）
//
//  Created by 邵泽俊 on 2017/9/26.
//  Copyright © 2017年 邵泽俊. All rights reserved.
//

import Foundation

protocol classa {
    
    var marks: Int { get set }
//    var result: Bool { get }
    
    func attendance() -> String
    func markssecured() -> String
}

 protocol classb: classa {
    
    var present: Bool { get set }
//    var subject: String { get set }
//    var stname: String { get set }
    
}
