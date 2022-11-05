//: Playground - noun: a place where people can play

import UIKit

//可选类型
// swift中规定: 对象中的任何属性在创建的时候，都必须有明确的初始化值
//定一个类  必须要有初始值类型
class Student:NSObject{
//    var name :String
}


//1 定义一个可选类型
//  1> 方式一：常规方式（不常用）
//var name :Optional<String> = nil
//  2> 方式二：语法糖（常用）
var name: String? = nil

//2 给可选类型赋值
name = "shaozj"

//3 取出可选类型的值
// 可选类型 + ！： 强制解包
print(name!)

//4 强制解包是非常危险的事情,如果可选类型为nil，强制解包会导致程序系统的崩溃
// 建议 ：在强制解包之前，先对可选类型进行判断，判断是否为nil
if name != nil{
    print(name!)
}

//5 可选绑定 系统其实做了两件事
//  判断name是否有值，如果没有值，直接不执行大括号内部的代码。
//  如果name有值，系统会自动将name解包，并且讲解包的结果，赋值给临时的变量，tmpName
//写法一：（不常用）
if let tmpName = name {
    print(tmpName)
}
// 写法二：（常用）
if let name = name {
    print(name)
}

// ++++++++++++++++可选类型的应用场景+++++++++++++++++
let url: NSURL? = NSURL(string: "www.baidu.com")
if let url = url {
    let request = NSURLRequest(url: url as URL)
}









