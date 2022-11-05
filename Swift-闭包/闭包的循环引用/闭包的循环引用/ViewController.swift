//
//  ViewController.swift
//  闭包的循环引用
//
//  Created by 邵泽俊 on 2017/1/2.
//  Copyright © 2017年 邵泽俊. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
//类似于OC Delloc
    deinit {
        print("销毁")
    }
    //定一个闭包的属性
    var completionCallBack:(() -> ())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
      //只是闭包对self进行copy 闭包执行完成后，会自动销毁，同事释放 self
      //循环引用 单方面的不会造成循环引用
      //解除循环引用需要打断 链条
        // 方法一：OC方式
        // 细节1 ：weak 只能修饰 var  不能修饰let  错误写法： weak let weakSelf = self
       weak var weakSelf = self
       loadData { (reslut) in
       //  细节2 解包有两种解包的方式
        /*
            ? 可选解包 如果self已经被释放  就不会像对象发送 getter的消息
            ! 强行解包  会导致崩溃
         */
        
        print(weakSelf?.view)
        }
        //方法二 ： Swift推荐方法 [weak self] 表示{} 所有的self都是弱引用，需要注意解包
        loadData { [weak self] in
            print(self?.view)
            
        }
        
        //方法三： Swift另外用法
        //[unowned self] 表示 {}中 self都是assign的，不会强引用，但是，如果对象释放，指针地址不会改变如果对象被释放，继续使用，就会造成野指针的操作
        loadData { [unowned self] in
//            print(self.view)
            
        }
    }
    
    func loadData(completion:@escaping () -> ()) -> Void {
    
        //控制器的属性闭包 引用  函数中的闭包
        completionCallBack = completion
        
        DispatchQueue.global().async { 
            
            DispatchQueue.main.async(execute: { 
                completion()
            })
        }
    }
    


}

