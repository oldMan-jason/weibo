//
//  ViewController.swift
//  数组
//
//  Created by 邵泽俊 on 2017/1/1.
//  Copyright © 2017年 邵泽俊. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        demo4()
    }

    // MARK:- 数组的快速定义
    func demo1() -> Void {
        //存在自动推导的功能 
        //可变数组的定义
//        var array = [Int]() 常用写法
//        var array1 :[Int] = Array()
        //不可以改变的数组定义
        let arrayStr = ["jason","shaozj"]
        let arrayInt = [1,2,3,4]
        //CG结构体 单个结构体放入到数组中，是不需要包装的
        let p = CGPoint(x: 20, y: 20)
        let arrayStruckt = [p]
        print(arrayStruckt)

        //混合数组  在Swift中 还有一种类型就是ansObject -> 任意类型, 在swift中 ,一个类可以没有任何的父类
        //在混合数组中，CG结构体需要包装 NSValue(cgPoint: p)
        let array = ["szj",12,"age= 18","元旦快乐",NSValue(cgPoint: p)] as Any
        print(array)
 
    }
    // MARK:- 数组的遍历
    func demo2() -> Void {
         let arrayStr = ["jason","shaozj","home","apple Store"]
        //1 > 按照下标遍历
        print("按照下标遍历")
        for i in 0..<arrayStr.count {
//            print(arrayStr[i])
        }
        //2 按照for in遍历元素
        print("按照for in遍历元素")
        for s in arrayStr {
//            print(s)
        }
        //3 enum block遍历  同事遍历下标和内容
        print("enum block遍历元素")
        for e in arrayStr.enumerated(){
//            print(e)
//            print("\(e.offset) \(e.element)")
        }
        //4 遍历下标和内容
        //offset数组里面的索引   element 对应的值
        for (offset,element) in arrayStr.enumerated(){
//            print("\(offset) \(element)")
        }
        //5 反序列遍历数组 reversed()
        for s in arrayStr.reversed().enumerated(){
            /*
             (0, "apple Store")
             (1, "home")
             (2, "shaozj")
             (3, "jason")
             */
//            print(s)
        }
        //6 反序列遍历数组的索引和内容 一下是错误的写法 因为索引和对应的值 不对应
        for (n,s) in arrayStr.reversed().enumerated() {
            /*
             0 apple Store
             1 home
             2 shaozj
             3 jason
             */
              print("\(n) \(s)")
        }
        // 正确的写法 应该是先遍历  在反序
        for (n,s) in arrayStr.enumerated().reversed() {
            print("\(n) \(s)")
        }
        
    }
    
    // MARK:- 数组的增删改
    func demo3() -> Void {
        var array = ["老虎","狮子","猴子","大象"]
        //1 追加元素
        array.append("🐩")
        //2 修改元素
        array[0] = "鳄鱼"
        
        //3 删除元素
        array.remove(at: 2)
        
        //删除全部元素 并且保留空间
        array.removeAll(keepingCapacity: true)
        print("\(array) \(array.capacity)")
        
        
    }
    // MARK:- 数组合并
    func demo4() -> Void {
        let array1 = ["shijiazhuang","jason","123"]
        let array2 = ["🐘","恐龙","😁后"]
        //类型必须相同
        let arrayRuslt = array1 + array2
        print(arrayRuslt)
        
    }
    
    
    
    
    
}

