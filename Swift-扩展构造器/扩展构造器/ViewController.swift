//
//  ViewController.swift
//  扩展构造器
//
//  Created by 邵泽俊 on 2017/7/1.
//  Copyright © 2017年 邵泽俊. All rights reserved.
//

import UIKit


struct boxInt {
    var intValue : Int
}


/// - 重载操作符
func == (ls: boxInt,sh: boxInt) -> Bool {
    return ls.intValue == sh.intValue
}


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let t = Transport(price: 20, scope: "shaozju")
        t.num = 10
        
        //重载操作符
        let b1 = boxInt(intValue: 2)
        let b2 = boxInt(intValue: 3)
        print(b1 == b2)
        
        let hello : shareString = "shaozejun"
        hello.methodForOverride()
        hello.methodWithOutOverride()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

