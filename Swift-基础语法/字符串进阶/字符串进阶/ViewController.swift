//
//  ViewController.swift
//  字符串进阶
//
//  Created by 邵泽俊 on 2018/7/15.
//  Copyright © 2018年 gwtrip. All rights reserved.
//

import UIKit


extension String: Collection {
    
}


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let name = "hello_shaozejun"
        print(name.dropFirst())
        
        
        let nameIndex = name.index(name.startIndex, offsetBy: 3)
        let s = name[nameIndex]
        print(s)
        
        let n = String(name.characters.prefix(4))
        print(n)
        let n1 = (name as NSString).substring(to: 4)
        print(n1)
        
        
        
        
        
        
        
    }


}

