//
//  main.swift
//  09枚举
//
//  Created by 邵泽俊 on 16/8/7.
//  Copyright © 2016年 邵泽俊. All rights reserved.

import Foundation
/*
 枚举
 （1） 枚举基本语法
 
 
 */
//枚举的定义
enum Method {
//    case Add
//    case Sub
//    case Mul
//    case Div
    //或者
    case add,sub,mul,div
}
//写法一
var m0 : Method  = .add
//写法二
var m1 = Method.sub

func chooseMethod (_ op : Method) -> (Double ,Double) -> Double{

    switch op {
    case .add:
        func add(_ a: Double , b : Double) -> Double{
            
            return a + b
        }
        return add
        
    case .sub:
        
    case .mul:
        
    case .div:
        
    }
    
    
}
