//
//  main.swift
//  05字典
//
//  Created by 邵泽俊 on 16/7/30.
//  Copyright © 2016年 邵泽俊. All rights reserved.
//

import Foundation

/**
 1 字典的概念和定义 （key : value） 字典是基于哈希函数的
 swift 语言中不一定键值对类型匹配
 */

var dic = [Int : String]();
dic = [1 : "shao"];
var dic1 = ["1" : 2, "2":"shao",3 : "jun"] as [AnyHashable : Any]
print(dic1)

//特定类型的键值对
var dic2 : Dictionary <String, Int> = ["2": 23]
//字典的简单写法
var dic3 : [String : Int] = ["shao" :34]
print(dic3.count)


/**
 字典的操作
 */

var dict  = ["apple": "苹果", "bag" : "包包"]
dict["apple"] = "果粉"
dict.updateValue("苹果", forKey: "apple")
//隐式转换 //增加一个key ：value
/*
 updateValue("", forKey: "")
 这个方法 返回的是一个可选的类型值  需要的是隐式的转换  
 这个方法 做了两个步骤
  1》 首先去找dict里面是否有 "apple"这个键 如果有这个key，就给替换成你重新定义的value
  2》 如果没有 “apple”这个key， 就会返回一个nil，而且会在字典里面增加一个 你写的一个 key ：value
 */

if let orig = dict.updateValue("苹果", forKey: "apple"){
//                dict.updateValue("脉动", forKey: "appl") 字典中会增加 ["appl":"脉动"]
    print(dict["apple"])
    print(orig)
    print(dict)
}
dict["sns"] = "i love you"

print(dict)

/**
 字典的删除
 removeValueForKey()  这个方法也是返回一个可选类型的值
 如果 dict中有你要删除的key，就会删除dict中的value 返回一个apple对应的原来的value值
 如果没有你所写的key，就什么也不做
 */
if let old =  dict.removeValue(forKey: "apple"){
    print(old)
}
print(dict)

/**
 字典的遍历
 1> 元组的方式
 */
for (key, value )in dict{
    
    print("\(key) : \(value)")
}
for key in dict.keys{
    print(key)
}
for values in dict.values{
    print(values)
}











