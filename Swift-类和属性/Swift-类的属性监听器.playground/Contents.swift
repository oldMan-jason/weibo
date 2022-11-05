//: Playground - noun: a place where people can play

import UIKit

class Person:NSObject{
    //属性监听器
    var name :String? {
        //属性即将改变时监听
        willSet{
//            print("name\(name!)属性即将改变")
//            print(newValue!)
        }
        //属性已经改变时的监听
        didSet {
//            print("name\(name!)属性已经改变")
//            print(oldValue!)
        }
    }
    
    /**
        初始化器中设置初始值不会触发属性监听器
     */
    override init() {
        self.name = "";
    }
}
let p = Person()
p.name = "jason"

		
