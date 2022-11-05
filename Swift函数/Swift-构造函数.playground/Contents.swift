//: Playground - noun: a place where people can play

import UIKit

/*
 给自己的属性分配空间并且设置初始值
 调用父类的‘构造函数’，给父类的属性分配空间设置初始值
 NSObject没有属性，只有一个成员变量 isa
 */
//类型的定义


class Person :NSObject{
    
    var name:String? = nil
    var age :Int = 0
    var height :Int = 0
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
    //系统构造函数
    override init(){
        //在构造函数中，如果没有明确调用 super.init(),那么系统会帮助调用super.init()
        super.init()
        print("----")
    }
    
    //自定义 构造函数
    init(name:String,age:Int) {
        self.name = name
        self.age = age
    }
    
    //单独给类的属性赋值
    init(dict:[String:Any]) {
        //字典取值 得到的tempName是一个可选类型
        let tempName = dict["name"]
        //tempName 是一个Any？，需要转化成String？
        // as？最终转成的类型是一个可选类型
        // as！ 最终转化的类型是一个确定的类型
         name = tempName as? String
        
        // 如果初始化方法中没有传值 age 在从字典中取age，通过as！就会出错
//        let tempAge = dict["age"]
//        age = tempName as! Int

        /*
         不常用
         let tempAge = dict["age"]
         let tempAge1 = tempName as? Int
         if tempAge != nil {
         age = tempAge1!
         }
         */
        //常用方法
        if let tempAge = dict["age"] as? Int {
            age = tempAge
        }
    }
    
        //通过KVC 来赋值 必须要调用super.init()
        init(dict1:[String :Any]) {
         super.init()
            setValuesForKeys(dict1)
        }
        
}

let p = Person()

//自定义构造方法调用
let p1 = Person(name: "jason", age: 12)
print(p1.name!)

//单独赋值 调用
let p2 = Person(dict: ["name":"jason","age":12,"height":1.88])
print(p2.age)
//通过kvc赋值 调用
let p3 = Person(dict1: ["name":"jason","age":12,"height":1])
print(p3.height)




		
