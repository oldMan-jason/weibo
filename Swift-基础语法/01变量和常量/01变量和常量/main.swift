//
//  main.swift
//  01变量和常量
//
//  Created by 邵泽俊 on 16/7/30.
//  Copyright © 2016年 邵泽俊. All rights reserved.
//

import Foundation

print("Hello, World!")
//  定义一个变量 初始化之后 变量的值是可以进行修改的 隐式类型的转换（默认为Int）
var a = 10
print(a);

//定义一个常量  初始化之后 其值 是不可以被修改的
let b = 12
print(b);

/**
 类型的标注
 */
//1 通过var申明的变量  可以不需要初始化
var x : Int
//这个变量只可以给它复 你规定的类型值,例如:
x = 12;
//2 通过let申明的变量 必须要进行初始化
let x1 : Int = 8;


//隐式类型转换
// 已经暗含的了 类型的指派  如果 只是  var y; 这样是报错的，没有类型的匹配
var y = 10;

/**
 名称不用再符合标志符的规范
 */
let 常量 = 30

/**
 基本数据类型： 整数类型 小数类型
 Int8/16/32/64 
 有无符号数 UInt 8/16/32/64
 Double(64位)/ Float(32位)
 */
let interger1 :Int = 10;
let  unsignedInt : UInt = 21;

let interget2 :Int32 = 10;
let interger3 : Int64 = 10;
//UInt8 最大值
let maxNum :UInt8 = UInt8.max;
print(maxNum);

//浮点类型
let floatValue : Double = 21.233223;

/**
 两种基本类型是不可以进行隐式转换
 */
var intValue : Int = 10;
//var doubleValue : Double = intValue;

/**
 类型的推断 和 类型安全
 */
let stringValue : String = "hello"
var uint8value : UInt32 = 12;
var uint16value :UInt32 = 12;
var uint32value :UInt32 = uint8value + uint16value

/**
 类型的转换  强制类型的转换
*/
intValue = Int(floatValue)
print(intValue);

var uint8value1 : UInt8 = 12;
var uint16value1 :UInt16 = 12;
var uint32value1 :UInt32 = UInt32(uint8value) + UInt32(uint16value)


/**
 Bool 类型 true flase
*/

let turnOffLight = true;
if turnOffLight{
    print("Turn Off")
}else{
    print("Turn ON")
}

/**
 元组 将两个不同的数据类型组合在一起形成一个整体 就是一个元组 （30，“hello”）
 */
let student = ("zhangsan",30,12.02)
print(student.0)
print(student.1)
print(student.2)


let student1 :(String ,Int,Float) = ("zhangsan",30,12.02)
//通过这样的方式可以引用元组里面的每个值
let(name,age,score) = student1;
print(name)
print(age)
print(score)
//如果只是关注元组里面的某像元素  不关注的可以写  "_"
let (name1,_,score1) = student1;
print(name1)
print(score1)

let student2 = (name:"shaozejun",age:"27")
print(student2.name)
print(student2.age)

/** 重点
   可选值：有值，没有值（nil）
   可选值可以用if语句来进行判断
 */
var optvalue :Int? = 9

if (optvalue != nil) {
    
    print(optvalue)
}
//   "!"  表示对可选值的强制解包
var svalue :Int = optvalue!
print(svalue)

//如果 当前的可选值 没有值  我们就不可以对其进行强制解析 错误示范如下：
//var optionValue : Int?
//var svalue1 = optvalue!
//print(svalue1)

//可选绑定
if var svalues = optvalue {
    print(svalues)
    
}

/**
 隐式解析可选类型  两种状态 ： 有值  没有值（nil）
 如果初始化 隐式解析可选值 没有值的话  隐式解析 还是会出现运行时错误
 
 */

var impOptvalue : Int! = 10
//var impOptvalue : Int!   注意
if (impOptvalue != nil) {
    print(impOptvalue)
}
if var newimpOpvalue = impOptvalue {
    print(newimpOpvalue)
}
var newvalue :Int = impOptvalue   //运行出现错误的地方



