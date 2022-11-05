//
//  main.swift
//  06流程控制语句
//
//  Created by 邵泽俊 on 16/7/31.
//  Copyright © 2016年 邵泽俊. All rights reserved.
/*
    三种基本结构： a 顺序执行 b 选择执行 c 循环执行
 （1）选择执行 （基于if）
 （2）循环执行
 （3）选择执行 （基于switch）
 */

import Foundation
//基于if语句的选择执行 if (条件){指令}
let a : Int =  10
let b : Int = 12
var value :Int
value = a

if b > a {
    value = b
}

//while循环语句
var i : Int = 1
var sum : Int = 0

//while i <= 10 {
//    sum += i;
//    i ++
//}

//循环控制语句中的转移语句 break and  continue
// break 退出整个循环
// continue 退出本次循环
var array = [1,2,3,4]
for values in array{
    
    print(values)
}

//continue
var cnt : Int
cnt = 0

for a in array{
    
    if a%2 != 0
    {
        continue
    }
//    cnt ++
}












