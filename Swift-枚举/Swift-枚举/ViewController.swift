//
//  ViewController.swift
//  Swift-枚举
//
//  Created by 邵泽俊 on 2016/12/1.
//  Copyright © 2016年 邵泽俊. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
    //Swift枚举的基本语法   
        //枚举的定义写法一：
        enum Method {
            case Add
            case Sub
            case Mul
            case Div
        }
        //枚举的定义写法二：
        enum Method2 {
            case Add,Sub,Mul,Div
        }
        
        //设置枚举的原始值类型 后面的值依次递增
        enum Method3:Int{
            case Add = 2,Sub,Mul,Div
        }
        
        //设置枚举值为string
        enum Method4:String {
            case Add = "add",Sub = "sub",Mul = "mul",Div = "div"
        }
        
        //写法一：
        var m0 :Method = .Add
        //写法二：
        var m1 = Method.Add
        
    //Swift中的Swich和枚举的匹配  没有完全匹配枚举里面的值 需要加defalut
        func chooseMethod(op: Method) ->(Double,Double) -> Double{
            
            switch op {
            case .Add://函数类型
                func add(a: Double , b : Double) -> Double{
                    return a + b
                }
                return add
        
            case .Sub:
                return{//闭包类型
                   (a :Double,b :Double) -> Double in return a - b
                }
        
            case .Mul://闭包的简写
                return {return $0 * $1 }
        
            case .Div:
                return {$0 / $1}
            break
            }
        }
        
        
        let value = chooseMethod(op: .Add)(32,3)
        print(value)
        
        
/**************************枚举的关联值*****************/

        enum lineSegmentDescriptor{
            
            case StartAndEndPattern(start: Double,end:Double)
            case StartAndLengthPattern(start:Double,length:Double)
        }
        let lsd = lineSegmentDescriptor.StartAndEndPattern(start: 10, end: 20)
//        lsd = lineSegmentDescriptor.StartAndLengthPattern(start: 3, length: 2)
        
//通过swich case来获取关联值中设置的值
        switch lsd {
        case .StartAndEndPattern(let s,let e):
            print("\(s) ->  \(e)")
        break
        case .StartAndLengthPattern(let s, let l):
            print("\(s) -> \(l)")
        break
        }
        
        //写法二“
        switch lsd {
        case let .StartAndEndPattern(s,e):
            print("\(s) ->  \(e)")
            break
        case let .StartAndLengthPattern(s,l):
            print("\(s) -> \(l)")
            break
        }
    
    }


}

