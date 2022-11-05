//
//  AppDelegate.swift
//  Swift-自定义log
//
//  Created by 邵泽俊 on 2016/11/28.
//  Copyright © 2016年 邵泽俊. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        ZJLog(message: "appdelegate")
        return true
    }
}

// 全局函数
func ZJLog<T>(message:T, file: String = #file,funcName: String = #function,lineNum: Int = #line) -> Void {
    
    #if DEBUG
    //获取所在文件路径
    let fileName = (file as NSString).lastPathComponent
//    print("\(fileName):[\(funcName)]:[\(lineNum)]-[\(message)]")
      print("\(fileName):[\(lineNum)]-[\(message)]")
    #endif
    
}
