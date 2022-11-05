//
//  ViewController.swift
//  Swift-闭包的使用
//
//  Created by 邵泽俊 on 2016/11/26.
//  Copyright © 2016年 邵泽俊. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var tools:httpTool = httpTool()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    /*
    补充
         在OC中
         __weak修饰的弱引用，如果指向的对象销毁，那么指针会立马指向nil
         __unsafe_unretained 修饰的弱引用，如果指向的对象销毁，那么指针依然指向之前的内存地址，那容易
         产生“野指针”/“僵尸对象”
    */
    
        //解决闭包的循环引用 方式一：
        weak var weakSelf = self
        tools.loadData { (JaosnString) in
            print("\(JaosnString)")
            /*
             weakSelf?  表示 如果前面的可选类型没有值 后面的代码都不会执行
            如果前面的可选类型有值，系统会自动将weakSelf 解包，并使用weakSelf
             */
            weakSelf?.view.backgroundColor = UIColor.red;
        }
       
        //解决闭包的循环引用 方式二： 非常不安全 很容易产生坏内存的访问
        tools.loadData { [unowned self] (JaosnString) in
            print("\(JaosnString)")
            /*
             weakSelf?  表示 如果前面的可选类型没有值 后面的代码都不会执行
             如果前面的可选类型有值，系统会自动将weakSelf 解包，并使用weakSelf
             */
            self.view.backgroundColor = UIColor.red;
        }
        
        
        //解决闭包的循环引用 方式三： 最常用
        tools.loadData { [weak self] (JaosnString) in
            print("\(JaosnString)")
            /*
             weakSelf?  表示 如果前面的可选类型没有值 后面的代码都不会执行
             如果前面的可选类型有值，系统会自动将weakSelf 解包，并使用weakSelf
             */
            self?.view.backgroundColor = UIColor.red;
        }
        
        //尾随闭包：如果闭包作为方法的最后一个参数，那么闭包可以将（）省略掉
        //写法一
        tools.loadData (callBack: { [weak self] (JaosnString) in
            print("\(JaosnString)")
            /*
             weakSelf?  表示 如果前面的可选类型没有值 后面的代码都不会执行
             如果前面的可选类型有值，系统会自动将weakSelf 解包，并使用weakSelf
             */
            self?.view.backgroundColor = UIColor.red;
        })
        //写法二
        tools.loadData() { [weak self] (JaosnString) in
            print("\(JaosnString)")
            /*
             weakSelf?  表示 如果前面的可选类型没有值 后面的代码都不会执行
             如果前面的可选类型有值，系统会自动将weakSelf 解包，并使用weakSelf
             */
            self?.view.backgroundColor = UIColor.red;
        }
    }
    
    deinit {
        print("控制器销毁")
    }

}

