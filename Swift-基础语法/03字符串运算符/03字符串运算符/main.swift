//
//  main.swift
//  03字符串运算符
//
//  Created by 邵泽俊 on 16/7/30.
//  Copyright © 2016年 邵泽俊. All rights reserved.
//

import Foundation
/**
 数值运算符
 + - * / %  ++ --
 */
let v1: UInt8 =  222
let v2 :UInt8 =  100
//这样容易溢出
//let v3 :UInt8 = v1 + v2
//print(v3)

//在求余数的时候 可以对小数进行取余数的运算
//print(9%2.5)


/**
赋值运算符 swift不允许 连续赋值
 */
let b  = 9
let c = 10

/**
 关系运算符  三目运算符
 */
let res: Bool = 5 == 5+3
/**
 逻辑运算符  ！ && ||
 */
var allowleave = false
if !allowleave {
    print("NO")
}







