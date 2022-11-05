//
//  ViewController.swift
//  字典
//
//  Created by 邵泽俊 on 2017/1/1.
//  Copyright © 2017年 邵泽俊. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
     
        demo4()
        
    }
    // MARK:- 字典定义
    func demo1() -> Void {
        
        let dict = ["name":"shaozj","age":"12"]
        let dict1 :[String:Int] = ["height":170,"score":99]
        var dic2 = [String:Any]()
    }
    // MARK:- 字典修改
    func demo2() -> Void {
        //如果key不存在 就是新增 否则就是修改
        var dict = ["name":"shaozj","age":"12"]
        dict["title"] = "很好"
        //删除 - 直接给定key就可以删除
        dict.removeValue(forKey: "age")
        print(dict)

        
    }
    // MARK:- 字典遍历
    func demo3() -> Void {
        
        let dict = ["name":"shaozj","age":"12","height":170] as [String : Any]
        for e in dict {
            //e 是一个元组  ("age", "16")
            print("\(e.key) \(e.value)")
        }
        
        for (key,value) in dict {
            print("\(key)  \(value)")
        }
   
        
    }
    // MARK:- 字典的合并
    func demo4() -> Void {
        var dict = ["name":"shaozj","age":"12","height":170] as [String : Any]
        let dict2 = ["name":"jj","age":"16","height":160] as [String : Any]
        for d in dict2 {
            print(d)
            dict[d.key] = dict2[d.key]
            print(dict)
            
        }
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    

}

