//: Playground - noun: a place where people can play

import UIKit

// MARK:- 字符串的定义
// 定义一个不可变字符串
let strname = "shaozejun"

// 定义一个可变的字符串
var strM = ""
var strM1 = String()

//判断字符串是否为空
strname.isEmpty

//字符串的遍历
for c in strname.characters{
    print(c)
}
// 3, 字符串的拼接
//  3.1 两个字符串之间的拼接
let chare :Character = "!"
let str1 = "这个是一个字符串的demo1"
let str2 = "这个是一个字符串的demo2"
let str3 = str1 + str2
print(str3)

var instruction = "look over"
let string2 = " there"
instruction += string2
print(instruction)

//  3.2 字符串和其他标识符之间的拼接(插入)
let name = "shaozj"
let height = "172"
let age = "27"
let info = "my name is \(name), my age is \(age), my height is \(height)"
print(info)

//  3.3 拼接字符串时，字符串的格式化
let min = 2
let second = 8
let newStr = String(format: "%d", min)
print(newStr)
let time = String(format: "%02d:%02d", min,second);
print(time)

// 4 字符串的截取
let urlstr = "www.baidu.com"
//首先将String类型转化成NSString类型
let headerStr = (urlstr as NSString).substring(to: 3)
print(headerStr)
let middle = (urlstr as NSString).substring(with: (NSMakeRange(4, 5)))
print(middle)
let footer = (urlstr as NSString).substring(from: 10)
print(footer)

// 5 字符串的比较 --> 比较字符串的值：字符串相等，前缀相等和后缀相等
// 5.1 字符串相等
let quotation = "We're a lot alike, you and I."
let sameQuotation = "We're a lot alike, you and I."
if quotation == sameQuotation {
    print("字符串相等")
}
//字符串的转化为基本数据类型
var intStr = "2334"
let i = (intStr as NSString).floatValue
let j  = (intStr as NSString).intValue

//  5.2 前缀/后缀相等
let romeoAndJuliet = [
                    "Act 1 Scene 1: Verona,A public place",
                    "Act 1 Scene 2: Capulet's mansion",
                    "Act 1 Scene 3: A room in Capulet's mansion"
                     ]

var act1SceneCount = 0
for scene in romeoAndJuliet{
    //前缀
    if scene.hasPrefix("Act") {
        act1SceneCount += 1
    }
}

for scene in romeoAndJuliet{
    // 后缀
    if scene.hasSuffix("n") {
        act1SceneCount += 1
    }
}

// 6 字符串的大小写
let normal = "Could you help me, please?"
//转化大写
let shouty = normal.uppercased() // shouty 值为 "COULD YOU HELP ME, PLEASE?"
//转化小写
let whispered = normal.lowercased() // whispered 值为 "could you help me, please?"

























