//
//  ViewController.swift
//  Swift计算型属性
//
//  Created by 邵泽俊 on 2017/1/16.
//  Copyright © 2017年 邵泽俊. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
        let p = Person()
        //setter方法
        p.name = "ss"
        // getter
        print(p.name!)
    
//      Cannot assign to property: 'title' is a get-only property
        //不允许 修改只读属性的值
//      p.title = "jason"
        
        
        
        
        
    }

    

}

