//
//  ViewController.swift
//  Swift-闭包的使用02
//
//  Created by 邵泽俊 on 2016/12/1.
//  Copyright © 2016年 邵泽俊. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
     /*
        函数表达式
        func funcName (参数) -> 返回值类型{
            执行语句
        }
        闭包表达式的语法
        {
         （参数）-> 返回值类型 in 
            ..... 执行语句
        }
     */
      
    //闭包表达式的使用 将闭包表达式 赋值给一个常量或者变量
        let sayHello :() -> Void =
            {
            print("hello world")
        }
        sayHello()
        
        let add : (Int,Int) -> Int = {
            //定义一个闭包表达式
            (a: Int,b: Int) -> Int in
            return a + b
        }
        add(3, 5)
//        print(add(3,5))
        
/************************普通的方法进行排序************************/

     //闭包表达式的回调 将闭包作为一个函数的返回值
        
        //定一个 遍历数组的函数
        func showArray (array : [Int]){
            for i in array{
                print("\(i)")
            }
            print()
        }
        //数组的冒泡排序
        func bubbleSort(array: inout [Int]){
            let cnt = array.count
            for i in 1 ..< cnt {
                for j in 0 ..< cnt-i{
                    if array[j] > array[j + 1] {
                        let temp = array[j]
                        array[j] = array[j + 1]
                        array[j + 1] = temp
                    }
                }
            }
        }
        var TestArr = [20,37,8,98,38,62]
        //原来的数组顺序
//        showArray(array: TestArr)
        //调用排序方法
//        bubbleSort(array: &TestArr)
        //排序后的数组顺序
//        showArray(array: TestArr)
        

/*********************通过闭包的方法解决排序的问题*************************/
        //定义一个闭包的策略
        let intTemp = {
            (a: Int, b: Int) -> Int in
            if a > b {
                return -1
            }else if a < b {
                return 1
            }else{
                return 0
            }
        }
        
        //添加传递策略方法
        func bubbleSort1( array: inout [Int],cmp:(Int,Int) -> Int){
            let cnt = array.count
            for i in 1 ..< cnt {
                for j in 0 ..< cnt-i{
                   //使用闭包的策略来选择 排列顺序 cmp(array[j] , array[j + 1]) == -1
                    if cmp(array[j] , array[j + 1]) == -1 {
                        let temp = array[j]
                        array[j] = array[j + 1]
                        array[j + 1] = temp
                    }
                }
            }
        }
        
        //函数调用
//        bubbleSort1(array: &TestArr, cmp: intTemp)
        
        //或者下面的这个写法⬇️
        
        /*
         闭包表达式作为回调用法
         闭包作为 直接作为bubbleSort1的实参数
         */
        bubbleSort1(array: &TestArr, cmp: {
            //闭包回调
            (a: Int, b: Int) -> Int in
            
            if a > b {
                return -1
            }else if a < b {
                return 1
            }else{
                return 0
            }
        })
        
//        showArray(array: TestArr)
        
/**********************闭包表达式的优化**********************/
        
        bubbleSort1(array: &TestArr, cmp: {
            //闭包回调
            (a, b)  in
            if a > b {
                return -1
            }else if a < b {
                return 1
            }else{
                return 0
            }
        })
        
/***********************嵌套函数****************************/
        
        //交换两个值得函数 单独函数
//        func swapValue(a: inout Int, b : inout Int){
//            let t = a
//            a = b
//            b = t
//        }
        
        
        //函数的嵌套
        func bubbleSort2(array: inout [Int]){
            let cnt = array.count
            //嵌套的函数
            func swapValue(a: inout Int, b : inout Int){
                let t = a
                a = b
                b = t
            }
            
            for i in 1 ..< cnt {
                for j in 0 ..< cnt-i{
                    //使用闭包的策略来选择 排列顺序 cmp(array[j] , array[j + 1]) == -1
                    if array[j] > array[j + 1] {
                        //调用函数
                       swapValue(a: &array[j], b: &array[j + 1])
                    }
                }
            }
        }
        

        var swapArray  = [23,89,27,19,34]
        bubbleSort2(array: &swapArray)
//        showArray(array: swapArray)
        
/*******************闭包捕获值***************************/
        func getNumFunction(num: Int) ->(Int) -> Int{
            var mt = 10
            func numFunction(v: Int) -> Int{
                mt += 1
                return num + v + mt
            }
            return numFunction
        }
        //num 参数被保留  如果mt声明在被包含的函数外部 这个值会被getnumFunc1记录
        let getnumFunc1 = getNumFunction(num: 2)
        let getnumFunc2 = getNumFunction(num: 2)
        
        //再利用返回的函数继续调用
        print(getnumFunc1(3))
        print(getnumFunc1(3))
        //区别
        print(getnumFunc2(3))
         
        
        
        
    }
}




