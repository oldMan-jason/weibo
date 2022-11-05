//: Playground - noun: a place where people can play

import UIKit


//简单分支
let x = 10
//条件 不需要 () ,语句必须有 {}
if x > 5 {
    print("大了")
}else{
    print("小了")
}

//三目运算
let x1 = 20
x1 > 10 ? print("大了") : print("小了")

//或者 
x1 > 12 ? print("大了") : ()

var str = "Hello, playground"

// 1 switch基本用法
//
//  与OC的区别 1 switch后面的大（）可以省略
//      2 case语句结束后，break也可以省略
//      3.可以对任意类型的值进行分支，不在局限整数
//      4.所有的分支至少需要一条指令，如果什么都不用，才使用break


// 0 男  1 女
let sex = 0
switch sex {
case 0:
    print("男")
case 1:
    print("女")
default:
    print("其他")
}

// 2 基本
// 2.1 如果系统某一个case中产生case穿透，可以在case结束后面跟上 fallthrough
// 2.2 case后面可以判断多个条件，多个条件以 , 分割
switch sex{
case 0 , 1:
    print("正常人")
default:
    print("other")
}


// 3.1 switch 中可以判断浮点型
let pai = 3.14
switch pai{
case 3.14:
    print("pai")
default:
    print("other")
}

// 3.2 switch可以判断 字符串

let  opreation = "+"
let  m = 12
let  n = 21
var sum = 0
switch opreation {
    case "+":
    sum = m + n
    case "-":
    sum = m - n
default:
    print("")
}


// 4 switch 可以判断区间
// 区间： 开区间： 0..<20  -> 0~ 19
let score = 100
switch score {
case 0..<60:
    print("不及格")
case 60..<80:
    print("及格")
case 80..<90:
    print("良好")
case 90...100:
    print("优秀")
default:
    print("")
}























