//
//  ViewController.swift
//  Swift-属性
//
//  Created by 邵泽俊 on 2016/12/2.
//  Copyright © 2016年 邵泽俊. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //结构体存储属性
        struct Person {
            var name : String
            var age : Int
        }
        //结构体常量对象，它本身是一个常亮，其次其对应的对象不可以被修改 结构体对象 是 值得引用
        //类常亮对象，它本身是一个常亮，其次它对应的对象，可以通过它来修改
        var p = Person(name:"szj",age:12)
        p.name = "jason"
        p.age = 32
        
        //类的存储属性
        class PersonClass {
            var name : String? = nil
            var age : Int = 0
        }
        let pe = PersonClass()
        pe.name = "szj"
        pe.age = 21
        
        /*
         计算属性
         
         */
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
    
    }


}

