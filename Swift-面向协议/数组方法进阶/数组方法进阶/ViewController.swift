//
//  ViewController.swift
//  数组方法进阶
//
//  Created by 邵泽俊 on 2017/7/8.
//  Copyright © 2017年 邵泽俊. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        
        super.viewDidLoad()
        //所有的闭包返回值 可以省略
        //1 filter : 过滤数组中不满足条件的元素，返回满足条件的元素组成一个新的数组。
        let array = [1,2,3,4,5,6]
        let filterArray = array.filter { (element) -> Bool in
            return element > 4
        }
        print(filterArray)
        
        
        //2 map  : 将原来数组中的元素映射到新的数组中。 返回值类型原本是T,可以自己定义；
        let mapArray = array.map { (element) -> String in
            return "\(element * 10)"
        }
        print(mapArray)
        
        let digitNames = [
            0: "Zero",1: "One", 2: "Two",3: "Three", 4: "Four",
            5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
        ]
        let numbers = [16, 58, 510]
        let strings = numbers.map{
            (number) -> String in
            print(number)
            var number = number
            var output = ""
            
          while number > 0 {
                output = digitNames[number % 10]! + output
                number = number/10
            }
            return output
        }
        print(strings)
        
        //通过结构体初始化数组
        let studentArray :[Student] = [Student(name: "s", age: 12),Student(name: "liie", age: 100),Student(name: "jason", age: 24)]
        
        let nameList = studentArray.map { (student) -> Int in
            return student.age
        }
        for age in nameList {
            print(age)
        }
        
        //3 flatmap ： 数组的嵌套
        let colors = ["blue","green","red"]
        let shapes = ["circle","square","triangle"]
        
        let colorshapesArray = colors.map { (col) in
            shapes.map({ (shap) in
                return col + shap
            })
        }
//        print(colorshapesArray)
        
        //数据嵌套的优化： 如果只需要底层的数据，则最外层使用 flatmap
        let coloshap = colors.flatMap { (color) in
            shapes.map({ (shap)  in
                return shap + color
            })
        }
         print(coloshap)
        
        //4 reduce : 可以把数组变成一个元素，首先需要指定一个初始值。
        let reduceArray = ["shao","ze","jun"]
        let numberSum = reduceArray.reduce("") { (a: String, b: String) -> String in
            return a + b
        }
        print(numberSum)
        
        // sort: 排序
        var array1 = [3,1,6,9,4]
        array1.sort { (a, b) -> Bool in
            return a > b
        }
        print(array1)
        
        //indexOf 获取某一个元素的下标
        let indexArray = array1.index(of: 9)
//        print(array1[indexArray!])
        
        let index = array1.index(after: 3)
        print(index)
        
        let index1 = array1.index(before: 3)
        print(index1)
        
        
        //中文转拼音
        let chineseStr = transform(chinese: "邵泽俊")
        print(chineseStr)
        
    }
    
    func transform(chinese: String) -> String {
        
        let mutableStr = NSMutableString(string: chinese) as CFMutableString
        if CFStringTransform(mutableStr, nil, kCFStringTransformToLatin, false) && CFStringTransform(mutableStr, nil, kCFStringTransformStripCombiningMarks, false) {
            return mutableStr as String
        }else{
            return ""
        }
        
        
        
    }


}

