//
//  main.swift
//  02字符和字符串
//
//  Created by 邵泽俊 on 16/7/30.
//  Copyright © 2016年 邵泽俊. All rights reserved.
//

import Foundation

print("Hello, World!")
/**
 字符
 */
var c: Character
c = "s"
c = "邵"

/**
 字符串
 */
var str : String
str = "shaozejun"

/**
 字符串的构造
 */
let str1 = "hello"
let str2 = "world"
print(str1 + str2)
/**
 字符串的插入  \()
 */
let index = 9
var urlhead  = "www.baidu.com"
var messsage = "\(urlhead)/picture/\(index)"
print(messsage)

/**
字符串的操作
 */
//1 字符串的比较
let string1 = "shaozejun@163.com"
if string1 > "abcd" {
    print(string1)
}
//是否有前缀
if string1.hasPrefix("shaozejun"){
    print(string1)
}
//判断string1 是否为空
if string1.isEmpty {
    print(string1)
}
//后缀
if string1.hasSuffix("@163.com"){
    print(string1)
}
//字符串大写
print(string1.uppercased())
//首字母大写
print(string1.capitalized)
//首字母小写
print(string1.lowercased())

//字符串的截取
var completeStr :String = "i code my life"

var fromStr = (completeStr as NSString).substring(from: 2)
var toStr = (completeStr as NSString).substring(to: 4)
var rangStr = (completeStr as NSString).substring(with: NSMakeRange(4, 2))
print(fromStr)
print(toStr)
print(rangStr)




















