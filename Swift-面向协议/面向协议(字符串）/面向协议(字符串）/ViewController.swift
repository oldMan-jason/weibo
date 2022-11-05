//
//  ViewController.swift
//  面向协议(字符串）
//
//  Created by 邵泽俊 on 2017/6/30.
//  Copyright © 2017年 邵泽俊. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //字符串的下标 String.Index
        let str = "shaozejun"
        let index = str.index(str.startIndex, offsetBy: 3)
        print(index)
        //通过字符串下标获取字符
        let c = str[index]
        print(c)
        
        //检查字符串下标是否越界 api函数
        let index2 = str.index(str.startIndex, offsetBy: 5, limitedBy: str.endIndex)!
        let c2 = str[index2]
        print(c2)
        
        
        //截取某一段
        let str2 = "hello world"
        let start = str2.index(str2.startIndex, offsetBy: 2)
        let end = str2.index(str2.startIndex, offsetBy: 3)
        let c3 = str2[start...end]
        print(c3)
        
        let str3 = "you are-best boy"
        // Range<String.Index>?
        let rang = str3.range(of: "-")
        let c4 = str3[str3.startIndex..<rang!.upperBound]
        print(c4)
        let c5 = str3[(rang!.upperBound)..<str3.endIndex]
        print(c5)
        
        //移除
        var str4 = "removeString"
        let start4 = str4.index(str4.startIndex, offsetBy: 2)
        let end4 = str4.index(str4.startIndex, offsetBy: 3)
        let rstr = str4.remove(at: start4)
        
        print(rstr)
        print(str4)
        
        //替换
       var str5 = "replace-String"
       let strat5 = str5.index(str5.startIndex, offsetBy: 3)
       let end5 = str5.index(str5.startIndex, offsetBy: 6)
       str5.replaceSubrange(strat5...end5, with: "我是")
       print(str5)
       
        
    }
}

