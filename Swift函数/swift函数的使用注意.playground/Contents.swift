//: Playground - noun: a place where people can play

import UIKit

func sum (num1 :Int, num2:Int)->Int{
    return num1 + num2
}
sum(num1: 20, num2: 10)

//注意一：内部参数和外部参数
//内部参数：在函数内部可以看到的参数就是内部参数，默认情况下所有的参数都是内部参数
// 外部参数：在函数外部可以看到的参数名称就是外部参数。默认情况下第二个参数开始既是内部参数也是外部参数
// 如果希望第一个参数也是外部参数，可以在标识符前给该参数添加一个别名


//注意二：默认参数
func makeCoffee(coffeeName:String)->String
{
    return "制作了一杯\(coffeeName)咖啡"
}
makeCoffee(coffeeName: "卡布奇诺")
makeCoffee(coffeeName: "猫屎")
// 如果对方没有传参数 就需要程序自动给他一个默认的参数
func makeCoffee1(coffeeName:String = "雀巢")->String
{
    return "制作了一杯\(coffeeName)咖啡"
}
makeCoffee1(coffeeName: "卡布奇诺")
makeCoffee1(coffeeName: "猫屎")
makeCoffee1()

//注意三：可变参数 参数的个数是可变的
func sumNew(num:Int...)->Int{
    var result = 0
    for n in num{
        result += n
    }
    return result
}
sumNew(num: 12,21,23,45)
print(sumNew(num: 12,23,100))

//指针类型
var m = 20
var n = 30
func swapNum ( m : inout Int, n: inout Int){
 let temp = m
    m = n
    n = temp
}
swap(&m, &n)

print("m \(m) n \(n)")



