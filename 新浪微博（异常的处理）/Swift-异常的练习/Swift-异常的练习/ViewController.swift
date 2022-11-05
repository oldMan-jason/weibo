//
//  ViewController.swift
//  Swift-异常的练习
//
//  Created by 邵泽俊 on 2016/11/29.
//  Copyright © 2016年 邵泽俊. All rights reserved.
    /*
    throws 异常抛出 练习
    */

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    //正则表达式
        //1 创建正则表达式的规则
        let patern = "abc"
        
        //2 创建正则表达式对象
        //处理异常方法一：
//        do{
//            let regex = try NSRegularExpression(pattern: patern, options: .caseInsensitive)
//        }catch{
//            print(error)
//        }
        
        //处理异常方法二：
//        let regex = try? NSRegularExpression(pattern: patern, options: .caseInsensitive)
//        guard regex != nil else {
//            return
//        }
        
        //处理异常三：非常的危险
        let regex = try! NSRegularExpression(pattern: patern, options: .caseInsensitive)
        
        
    }


}

