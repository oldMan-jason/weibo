//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
// 1 定义一个数组
//    1> 定义一个不可变数组： 使用let修饰的数组
let array1 : Array<String> = ["sjaka","qiafeng"]
let array2 : [String] = ["shajkd","sdkae"]
let temarr = ["22","ss"]

print(array1)
print(array2)
//简单粗暴的方法创建一个不可变数组
let simperArray = ["shaozj","jason","qianfeng"]

//    2> 定义一个可变的数组： 使用var修饰的数组
var arrayM1 = Array<String>()  //这种写法很少见
//或者  常用写法
var arrayM2 = [String]()

var arr = [[String : Any]]()
var ar = [Double]()

// 2 基本操作

    // 2.0 检查数据中的元素是否为0
    array2.isEmpty
    // 2.1 添加元素
arrayM2.append("hello world")
arrayM2.append("jasonshao")
arrayM2.append("shaozj")
arrayM2.append("便利书")
arrayM2.append("shuzu")
arrayM2.append("yuyuanhdjsa")
print(arrayM2)
    //2.2 插入元素
arrayM2.insert("ss", at: 2)
print(arrayM2)

    // 2.3 删除元素
arrayM2.remove(at: 0)
//arrayM2.removeAll()
print(arrayM2)
    // 2.4 修改元素
arrayM2[0] = "修改的元素"
print(arrayM2)
    // 2.5 去粗某一个元素
arrayM2[1]

// 3 遍历一个数组
    //3.1 遍历所有的元素
for i in 0..<arrayM2.count {
    print(arrayM2[i])
}
for name in arrayM2{
    print(name)
}
    //3.3 遍历数组中的前两个元素
for i in 0..<2{
    print(arrayM2[i])
}
for name in arrayM2[0..<2]{
    print(name)
}

// 4 数组的合并
    //4.1 注意： 相同类型的数组才尅进行合并，不同类型的数组是不可以进行合并
let reslutArray = arrayM2 + arrayM1










