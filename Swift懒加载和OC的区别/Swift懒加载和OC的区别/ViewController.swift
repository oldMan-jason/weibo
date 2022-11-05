//
//  ViewController.swift
//  Swift懒加载和OC的区别
//
//  Created by 邵泽俊 on 2017/1/11.
//  Copyright © 2017年 邵泽俊. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    /*
        一但 lable被设置为nil 懒加载也不会在执行
       懒加载的代码只会在第一次调用的时候，执行闭包，然后将闭包的结构保存在lable的属性中
     */
    lazy var lable :UILabel? = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        print(lable!)
        
        lable?.text = "jason"
        lable?.sizeToFit()
        view.addSubview(lable!)
        
        print(lable)
        
        lable = nil
        
        print(lable)
        
        
       
    }
    override func didReceiveMemoryWarning() {
        //Swift中 一定要注意 不要主动清理视图和空间 因为懒加载不会再调用
    }


}

