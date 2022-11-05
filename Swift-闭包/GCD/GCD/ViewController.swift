//
//  ViewController.swift
//  GCD
//
//  Created by 邵泽俊 on 2017/1/2.
//  Copyright © 2017年 邵泽俊. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //闭包函数的调用
        loadData { (reslut) in
            print("闭包获取的返回数据-\(reslut)")
        }
        
        //”尾“随闭包
        //如果函数的最后一个参数是闭包，函数参数可以提前结束，最后一个参数直接使用 {} 包装闭包的代码
        // loadData()
        loadData() { (reslut) in
//             print("闭包获取的返回数据-\(reslut)")
        }
        
        //最原始的写法 按照函数本身编写的结构
        loadData(completion: { (reslut) -> () in
//            print("闭包获取的返回数据-\(reslut)")
        })
        
        
        //
        
        
        
        
       
    }
    /*
     在异步执行任务的时候，获取结果，通过block、闭包进行回调
     闭包的应用场景和block完全一样
     */
    
    //定义一个参数 类型是一个闭包类型
    func loadData(completion: @escaping (_ result:[String])->()) -> Void {
        //GCD  队列调度任务（block、闭包）以同步或者异步的方式执行
        //异步的全局队列 子线程
        DispatchQueue.global().async {
            print("耗时操作-\(Thread.current)")
            //睡眠
            Thread.sleep(forTimeInterval: 1.2)
            
            let json = ["数据1","数据2"]
            //主队列
            DispatchQueue.main.async {
                print("主线程更新UI-\(Thread.current)")
                completion(json)
            }
        }
    }
    
    

}

