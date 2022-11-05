//
//  main.swift
//  08闭包
//
//  Created by 邵泽俊 on 16/7/31.
//  Copyright © 2016年 邵泽俊. All rights reserved.
//

import Foundation

/**
 1) 闭包的概念和分类
 概念:自包含的函数代码块
 全局函数（有名）
 闭包表达式（匿名函数） -- 能捕获上下文中的常量或者变量
 嵌套函数
 */

/**
 2) 闭包表达式的语法
 //函数结构 ：
 func funcName（参数）->返回值类型{
    执行语句
 }
 //闭包表达式结构（匿名函数）
 {
  （参数）-> 返回值类型 in
    执行语句
 }
 */
//定一个常量 = 闭包函数
//例如1
let sayHello = {
    print("helo")
}
//或者
let sayHello1:()->Void = {
    print("hello word")
}
//调用
sayHello()



//简单的闭包表达式的声明
//例如2  函数类型必须保持一致
let shao:(Int,Int)-> Int = {
    (a: Int,b: Int) -> Int in
    return a + b
}
print(shao(2,2))

/**
 3) 闭包表达式的回调方法
 */
var array = [20,34,78,26,18];

func bubbleSort(_ array :inout [Int]){
    let cnt = array.count
    
    for var i = 1; i < cnt; i += 1{
        for var j = 0;  j < cnt - 1; j ++{
        if (array[j]  > array[i]){
        let t = array[j];
        array[j] = array[j + 1]
        array[j + 1] = t
        }
      }
    }
    
}























