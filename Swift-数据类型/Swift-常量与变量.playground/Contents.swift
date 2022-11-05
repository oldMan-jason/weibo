//: Playground - noun: a place where people can play

import UIKit

//常量 初始化之后 不可修改
let maxloginCount = 10

// 多个常量的申明
let mutilNumber = 12,mutilnum1 = 32,mutilnum2 = 199

//变量 初始化之后 可以修改
var login = 1

var name:String = "jason"

// 多个变量的申明
var mulogin = 1,login1 = 12,login2 = 21

 /*
  基本数据类型  8 16 32 64
 Int
 Float
 Double
 */
let meaningOfLife = 42 // meaningOfLife 会被推测为 Int 类型
let pi = 3.14159 // pi 会被推测为 Double 类型
let anotherPi = 3 + 0.14159 // 同时出现了整数和浮点数，会被推测为Double类型： anotherPi 会被推测为 Double 类型
/*
    基本的布尔(Boolean)类型
 */
let orangesAreOrange = true
let turnipsAreDelicious = false

/*
 元组（tuples）把多个值组合成一个复合值。元组内的值可以使任意类型，并不要求是相同类型。
 如果你只需要一部分元组值，分解的时候可以把要忽略的部分用下划线（_）标记：
 let (statusCode1, _) = http404Error
 */
//元组初始化
let tup = (name:"haozj",age:12,id:12.3)
print(tup.age)

let http404Error = (404, "Not Found")
let (statusCode, statusMessage) = http404Error

print("The status code is \(statusCode)")
// 输出 "The status code is 404"
print("The status message is \(statusMessage)")





