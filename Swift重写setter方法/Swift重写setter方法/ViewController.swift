//
//  ViewController.swift
//  Swift重写setter方法
//
//  Created by 邵泽俊 on 2017/1/16.
//  Copyright © 2017年 邵泽俊. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
     
        let p = Person()
        p.name = "jason"
        
        let lable = DemoLable(frame: CGRect(x: 20, y: 50, width: 80, height: 20))
        
        view.addSubview(lable)
       
        //设置模型
        lable.p = p
        
        
        
    }

}

