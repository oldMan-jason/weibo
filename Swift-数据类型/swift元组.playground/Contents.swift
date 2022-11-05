//: Playground - noun: a place where people can play

import UIKit
// 元组  也是一个数据结构 一般是作为参数的返回值

// 1. 使用数组定义一组数组
let array = ["name","shaozj",12] as [Any]
let array1 :[Any] = ["name","shaozj",12]

// 2 使用字典定义一组数据
let  dict = ["name":"shaozj","age":18] as [String : Any]
let  dict1 : [String : Any] = ["name":"shaozj","age":18]

//3 使用元组定义一组数据 "()“ 元组一般作为方法的返回值
//写法1 简单粗暴
let info = ("happy",128,false,["name":"shaozj"])
print(info.3)
info.3
info.0
//写法2
//对元组进行取一个别名
let info1 = (name : "shazo",age : 12, score : 100, id : 1330, school :"wuzhi")
info1.score
info1.age
info1.name
//写法3
//元组中的元素的名称，就是元组的名称
let (name,age,height) = ("jason",18,1.8)
name
print(name)
age
height



