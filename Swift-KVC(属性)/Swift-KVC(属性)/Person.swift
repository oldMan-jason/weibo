//
//  Person.swift
//  Swift-KVC(属性)
//
//  Created by 邵泽俊 on 2017/1/8.
//  Copyright © 2017年 邵泽俊. All rights reserved.
/*
 1 定义模型属性的时候，如果对象，通常都是可选类型，
   -- 在需要的时候创建
   -- 避免写构造函数，可以简化代码
 
 */

import UIKit

class Person: NSObject {
    /*
    name 属性是可选的，在oc中，很多的属性，都是在需要的时候创建
     手机开发中，内存本宝贵，有些属性并不是一定需要分配内存空间，
     延迟加载，在需要的时候在创建
     */
    
    var name :String?
    //重载构造函数 使用字典为本类设置初始值
    init(dict :[String: Any]) {
        
        //保证对象已经完全初始化完成
        super.init()
        //KVC的方法 是oc的方法， 要求对象已经实例化完成 super.int()先调用
        setValuesForKeys(dict)
        
    }
    
    
}
