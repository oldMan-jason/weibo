//
//  Student.swift
//  Swift面向对象
//
//  Created by 邵泽俊 on 2017/1/8.
//  Copyright © 2017年 邵泽俊. All rights reserved.
//

import UIKit

class Student: Person {

    var number : String
    
    init(name: String,number:String) {
        
        //初始化本类的属性
        self.number = number
        
        //调用父类 给name初始化
        super.init(name : name)
    }
    
    
    
}
