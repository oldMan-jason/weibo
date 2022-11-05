//
//  AppDelegate.swift
//  ZJWeiBo
//
//  Created by 邵泽俊 on 2016/11/28.
//  Copyright © 2016年 邵泽俊. All rights reserved.

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
       
        //设置全局的TabBar颜色
        UITabBar.appearance().tintColor = UIColor.orange
        
        //创建window 设置frame
        window = UIWindow(frame: UIScreen.main.bounds)
        
        //设置根控制器
        window?.rootViewController = MainViewController()
        
        //window可见
        window?.makeKeyAndVisible()
        
        return true
    }

   

}

