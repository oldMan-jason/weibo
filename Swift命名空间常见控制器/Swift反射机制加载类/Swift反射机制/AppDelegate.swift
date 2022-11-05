//
//  AppDelegate.swift
//  Swift反射机制
//
//  Created by 邵泽俊 on 2017/1/16.
//  Copyright © 2017年 邵泽俊. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    /*
     1：知道： swift中 有命名空间
     - 在同一个命名空间中，全局共享
     - 第三那方框架使用swift如果直接拖拽到项目中，从属于同一个命名空间，很有可能冲突。
     - 尽量都使用cocoapods
     
     2: 重点要知道 Swift中 NSClassFromString（发射机制） 的写法，反射的最主要目的就是解耦
     
     */
    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        
        /*
            代码中 ？ 都是可选解包，不参与计算
            所有的 ？ 都是x-code自动添加
         */
        //1. 实例化window
        self.window = UIWindow()
        self.window?.backgroundColor = UIColor.white
        
        
        //一：静态获取命名空间
        //2 设置跟控制器,需要添加命名空间 -> 默认是 ‘项目名称’
//        let clsName = "Swift反射机制.ViewController"
        //AnyClass? -> 试图控制器的类型
//        let cls = NSClassFromString(clsName) as? UIViewController.Type
        
        //二：动态获取命名空间
        //1获取 info.plist文件, plist  [String : Any]? 是一个可选的字典，因此需要解包在取值， 如果字典为nil，就不取值。
//        let plist = Bundle.main.infoDictionary
        //2 通过key 取值 Any?
//        let VC_Name = plist?["CFBundleName"] as? String ?? ""
//        let vcStr = VC_Name + "." + "ViewController"
//        let cls = NSClassFromString(vcStr) as? UIViewController.Type
        
        //三： 抽取命名空间
//        let plist = Bundle.main.nameSpace()
//        let vcStr = plist + "." + "ViewController"
//        let cls = NSClassFromString(vcStr) as? UIViewController.Type
        
        //四 ： 利用计算型属性
        let plist = Bundle.main.namespace
        let vcStr = plist + "." + "ViewController"
        let cls = NSClassFromString(vcStr) as? UIViewController.Type

        // 使用类创建试图控制器
        let vc = cls?.init()
        
//      let vc = ViewController()
        window?.rootViewController = vc
        
        //3 window可见
        self.window?.makeKeyAndVisible()
        
        return true
    }

    
}

