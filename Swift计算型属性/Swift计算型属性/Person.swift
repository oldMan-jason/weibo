//
//  Person.swift
//  Swift计算型属性
//
//  Created by 邵泽俊 on 2017/1/16.
//  Copyright © 2017年 邵泽俊. All rights reserved.
//

import UIKit

class Person: NSObject {
    
    var _name :String?
    
//    getter&& setter  {} 表示对属性的修饰
    
    //在swift中 一般不会重写 getter 和 setter 方法
    var name : String? {
        
        get{
            //返回成员变量
            return _name
            
        }
        set{
            //使用成员变量记录值
            _name = newValue
        }
    }
    
    //OC中 定义一个属性有 readonly  -》 重写getter 方法
    var title : String{
        
        get{
            return (self.title ) + "你好"
        }
    }
    //只读属性的 简单写法  又称之为 计算属性， 本身不保存内容，都是通过计算
    var title2 : String {
        
           return (self.title2 ?? "" ) + "你好"
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}

