//
//  ViewController.swift
//  字符串
//
//  Created by 邵泽俊 on 2017/1/1.
//  Copyright © 2017年 邵泽俊. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    
    
        demo5()
        
        
        
    }
    // MARK:-字符串的遍历
    func demo1(){
        
        let str = "字符串的遍历"
        for c in str.characters {
            print(c)
        }
    }
    
    // MARK:- 字符串的长度
    func demo2() -> Void {
        let str = "hello world 邵泽俊"
        // 1> 返回指定的编码的对应的字节数量
        //UTF8的编码 汉字是3个字节
        print(str.lengthOfBytes(using: .utf8))
        // 2> 字符窜的长度 返回字符串的个数
        print(str.characters.count)
        // 3> 使用NSStrng 中转  str as NSString
        let ocStr = str as NSString
        print(ocStr.length)
        
    }
    // MARK:- 字符串的拼接
    func demo3() -> Void {
        
        let name = "shaozj"
        let age = 18
        print("名字 - [\(name)]  年龄 - [\(age)]")
        //可选项需要注意  title ?? ""   表示 如果可选值有值 就是用其本身，如果没有值，就采用后面的值
        let title: String? = "你最帅"
        print("\(title ?? "")")
        //结构类型
        let point = CGPoint(x: 20, y: 100)
        print("结构体 \(point)")
    }
    
    // MARK:- 字符串的格式化
    func demo4() -> Void {
        let H = 8
        let M = 12
        let S = 46
        let dataStr1 = String(format: "%02d:%02d:%02d", H,M,S)
        print(dataStr1)
    }
    
    // MARK:- 字符串的截取 建议：一般都是采用NSString进行中转
    func demo5() -> Void {
        //1 NSString 截取的方法
        let str = "元旦快乐,你是最棒的"
        let ocSTr = str as NSString
//        let str1 = ocSTr.substring(to: 5)
//        let str1 = ocSTr.substring(from: 7)
        let str1 = ocSTr .substring(with: NSMakeRange(2, 8))
        print(str1)
        
        //2 swift的写法
        let str2 = "字符串的截取方法采用swift"
        guard let rang = str2.range(of: "swift") else {
            return
        }
        print("-----")
        let stratStr1 = str2.substring(with: rang)
        print(stratStr1)
        
        let stratStr2 = str2.substring(from: str2.startIndex)
        let stratStr3 = str2.substring(to: "ceshi".endIndex)
        print(stratStr2)
        print(stratStr3)
        
        
        
    }
    
    
    

}

