//
//  main.swift
//  07swift函数
//
//  Created by 邵泽俊 on 16/7/31.
//  Copyright © 2016年 邵泽俊. All rights reserved.
//

import Foundation

print("Hello, World!")

/*
 函数的定义和调用
 定义 ： 完成某个特定任务的代码块，给代码快去一个合适的名字，称之为函数名，当函数被执行的时候，
 调用这个函数名字就可以了。
 swift 函数的定义语法：
 func 函数名 （参数名 ：参数类型，参数名 ：参数类型 ...） ->函数的返回值类型{
    函数的实现部分....
 }
 swift函数的调用语法
 函数名（实际参数...）
  */
func showArray(array1:[Int]) -> Void {
    for a in array1 {
        print("\(a)")
    }
}
showArray(array1: [0,1,11])

/*
 (2)函数的参数和返回值
 1 函数可以有多个参数
 2 函数可以没有返回值也没有参数
 3 函数可以返回多个值
 */

//有参数 有返回值
func maxValue(a: Int, b:Int) -> Int {
    return a > b ? a :b
}
print(maxValue(a: 12, b: 10))

//无参数 无返回值
func showHelloWord() -> Void {
    print("hello word")
}
print(showHelloWord())

//多参数 和多返回值
let p0 :(x:Double, y:Double) = (0,0)
let p1 :(x:Double,y:Double) = (6,6)
func getLengthAndWidth(p0:( x : Double,y: Double), p1:(x :Double ,y: Double)) -> (length:Double,width:Double) {
    return (abs(p0.x - p1.x),abs(p0.y-p1.y))
}

let  w  = getLengthAndWidth(p0: p0, p1: p1).width
let l  = getLengthAndWidth(p0: p0, p1: p1).length
print("\(w) \(l)")


/**
 函数的内部参数 和 外部参数
 */
func divisionOperation(dividend: Double,divisor:Double) -> Double {
    return dividend / divisor
}
//let res = divisionOperation(3.4, divisor: 1.3)

func divisionOperation(dividends a: Double,divisor b :Double) -> Double {
    //a b 就是函数的内部参数
    return a / b
}

let  newRes = divisionOperation(dividends: 2.1, divisor: 3.2)

//func divisionOperations( #dividendss : Double, #divisors :Double) -> Double {
//    //a b 就是函数的内部参数
//    return dividendss / divisors
//}

/**
 函数的默认参数 在函数定义的时候 我们希望 需要有默认参数值的地方进行赋值 joinStr join: String = "#"
 
 */
func joinString(s1:String,toString s2:String,joinStr join: String = "#")-> String{
    return s1 + s2 + join
}

let str = joinString(s1: "hello", toString: "-", joinStr: "word")

//默认参数值当没有 外部参数名的时候 内部参数名也是作为外部参数名  调用的时候可以重写外部参数
func joinString(s1:String,toString s2:String, join: String = "#")-> String{
    return s1 + s2 + join
}


/**
 常量参数和变量参数
 常量参数 只是能够读 不能够进行修改参数
 
 */
//交换两个变量的值
func swap( a :inout Int, b : inout Int) ->Void {
    let t = a
    a = b
    b = t
}
var x = 10
var y = 19
swap(&x, &y)
print("\(x) \(y)")

//变参函数  Int...   变参函数 一定要作为函数的最末尾参数
func add2 (array : Int...) -> Int{
    
    var sum = 0
    for i in array{
        
        sum += i
    }
    return sum
}
print(add2(array: 1,2,3))

//多参数的时候，变量参数必须放在 参数的做末尾
func add3(argnum : Int, array : Int...) -> Int{
    
    var sum = 0
    for i in array{
        
        sum += i
    }
    return sum
}
print(add3(argnum:12, array: 1,2,3))

/**
 函数类型  由函数的参数和返回值决定的  (Int ,Int)-> Int
 函数类型 变量 /常量
 函数类型作为参数
 函数类型返回值
 */
//两个类型相同的函数
func add(a: Int,b : Int) -> Int {
    return a + b
}
func sub(a : Int, b: Int) -> Int {
    return a - b
}
//定义一个函数类型的常量 或者 变量     calFun函数变量指向add函数
var calFunc : (Int,Int)->Int = add
calFunc = sub
print(calFunc(12,21))


//函数类型作为参数  op:(Int,Int)->Int 这就是一个函数类型的参数
func calPfunc(a: Int,b: Int,op:(Int,Int)->Int) ->Int{
    return op(a,b)
}
print(calPfunc(a:23, b: 12, op: add))

//函数类型的返回值
func max( j : Int, k : Int) ->Int{
    
    return j > k ? j : k
}
func min( j : Int, k : Int) ->Int{
    
    return j > k ? k : j
}

func chooseFunc(getMax: Bool) -> (Int ,Int)-> Int {
    return getMax ? max: min
}
var myfunc:(Int ,Int) -> Int = chooseFunc(getMax:true)
print(myfunc(2,5))


























