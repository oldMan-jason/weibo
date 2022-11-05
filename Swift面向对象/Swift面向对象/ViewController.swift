//
//  ViewController.swift
//  Swift面向对象
//
//  Created by 邵泽俊 on 2017/1/8.
//  Copyright © 2017年 邵泽俊. All rights reserved.
/*
 swift 默认同一个项目中，所有的类都是共享的。可以直接访问，不需要import
 所有的对象属性  var，也可以直接访问到
 */

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
     
        //实例化person  () 相当于 OC中的【alloc init】
//        let p = Person()
//        print(p.name)
        
        //重载方法的初始化对象
        let p1  = Person(name: "jason")
        print(p1)
        
        //继承方法的 对象初始化
        let s  = Student(name: "kk", number: "010")
        
        print(s.number)
        print(s.name)
        
        
        
    }


}

