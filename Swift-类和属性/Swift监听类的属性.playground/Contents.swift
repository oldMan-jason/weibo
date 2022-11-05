//: Playground - noun: a place where people can play

import UIKit

class Person:NSObject{
    // 属性监听器
    var name:String?{
    // 属性即将改变的时候进行监听  但是还没有改变
        willSet{
//            print(name);
            print(newValue)
        }
    // 属性已经改变  实际开发中使用该方法较多
        didSet{
//            print(name)
            print(oldValue)
        }
    }
}

let p = Person()
//p.name = "shaozj"
p.name = "QF"
    