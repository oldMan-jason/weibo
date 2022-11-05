//
//  ViewController.swift
//  Swift-结构体定义
//
//  Created by 邵泽俊 on 2016/12/1.
//  Copyright © 2016年 邵泽俊. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       //结构体的定义
        struct ZJ_Rect {
            var zj_width  : Double = 0.0
            var zj_heigth : Double = 0.0
        }
        //创建一个结构体对象
        var rect = ZJ_Rect()
        
        print(rect.zj_heigth)
        print(rect.zj_width)
        
        rect.zj_width = 12.2
        rect.zj_heigth = 32.9
        print(rect.zj_heigth)
        print(rect.zj_width)

        //结构体的构造函数 并不负责内存的分配
        //结构体逐一成员构造器
        var initRect1 :ZJ_Rect = ZJ_Rect(zj_width:12,zj_heigth:21)
        var initRect2 :ZJ_Rect = ZJ_Rect.init(zj_width: 21, zj_heigth: 22)

    
        
        
/************************结构体的成员方法*****************************/
        //结构体的成员方法的定义
        struct ZJ_Rect1 {
            var zj_width  : Double = 0.0
            var zj_heigth : Double = 0.0
            //成员方法 可以访问和使用成员属性
            func getWidth() -> Double {
                return zj_width
            }
        }
        //成员方法的调用方法 一定是依附于某一个对象,每一个对象访问自己的成员属性  对象.方法（）
        var useRect = ZJ_Rect1()
        useRect.zj_width = 10
        useRect.zj_heigth = 20
        print(useRect.getWidth())
        
    
        var rect2 = useRect
//        (1) rect2跟useRect是两个不同的实例，内容一致
        //证明
        rect2.zj_width = 100
        print(useRect.zj_width)
        print(rect2.zj_width)
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
    }


}

