//
//  ViewController.swift
//  Swift懒加载
//
//  Created by 邵泽俊 on 2017/1/11.
//  Copyright © 2017年 邵泽俊. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //初始化lable 并且分配空间 会提前创建，移动端需要 ‘延迟加载’ 减少内存的消耗
    // 懒加载 -lazy
    /*
        1 能够延迟创建
        2 最大的好处-》 可以解除 解包的烦恼 去除 ？ ！出现的次数
     */
    //简单的实现
//    lazy var lable : MyLable = MyLable()
    
    //完整的写法 日常开发不建议这么写,闭包中出现self，容易出现循环的引用，没有代码的提示。
    
    /*
       {} 包装代码
       () 执行代码
     
    */
    lazy var lable = { () -> MyLable in
        
        let lab  = MyLable()
        
        return lab
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
    }
    
    private func setupUI(){
        
        view.addSubview(lable)
        lable.text = "jason";
        lable.sizeToFit()
        lable.center = view.center
        
    }


}

