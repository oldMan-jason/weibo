//
//  Person.swift
//  Swift面向对象
//
//  Created by 邵泽俊 on 2017/1/8.
//  Copyright © 2017年 邵泽俊. All rights reserved.


/*
 1. 构造函数的目的：给自己的属性分配空间并且设置初始值
 2. 调用父类的构造函数之前，需要先给本类的属性设置初始值
 3. 调用父类的 ‘构造函数’，给弗雷的属性分配空间设置初始值
    NSObject没有属性，只有一个 isa
 4. 如果重载了构造函数，并且没有实现父类的init方法，系统就不会
  提供init（）构造函数（默认是会有的）
  因为默认的构造函数，不能给本类的属性分配空间

 */

import UIKit

class Person: NSObject {

    var name :String
    //重写  父类有这个方法
//    override init(){
//       
//        //问题：name 确实有初始值，但是所有的初始值，是“szj”
//        name = "szj"
//        // Property 'self.name' not initialized at super.init call
//        super.init()
//    }
    
    //重载  函数名字相同，参数和个数不同
    //重载可以给自己的属性从外部设置初始值
    //OC 是没有重载的写法的
    init(name:String) {
        
        //使用参数的name 设置给属性
        self.name = name
        
        //调用父类的构造函数
        super.init()
    }
    
    
    
}
