//
//  ViewController.swift
//  闭包
//
//  Created by 邵泽俊 on 2017/1/2.
//  Copyright © 2017年 邵泽俊. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    /*
        闭包
         1 提前准备好的代码
         2 在需要时执行
         3 可以当做参数传递
         */
        
    //1 > 最简单的闭包
        //如果没有参数和返回值 可以省略连 in也可以省略
        
        let b1 = {
            print("hello world")
        }
        //闭包执行
        b1()
    
    //2 > 带参数的闭包
        // 闭包中，参数，返回值，实现代码 都写在{}中
        // 需要使用一个关键字 ‘in’分割定义和实现
        // 语法格式 { 形参列表 -> 返回值类型 in 执行代码 }
        let b2 = { (x :Int) -> () in
            print(x)
        }
        b2(34)
        
    //3 带参数 和返回值 闭包
        let b3 = { (x :Int) -> Int in
            return x + 23
        }
        print(b3(34))
        
    }
    
    func demo1() -> Void {
        //1> 定一个常量记录 函数 (Int, Int) -> Int
        let f = sum
        //2> 需要时执行
        print(f(2, 2))
        
    }
    //函数定义
    func sum(x: Int,y:Int) -> Int {
        return x + y
    }


}

