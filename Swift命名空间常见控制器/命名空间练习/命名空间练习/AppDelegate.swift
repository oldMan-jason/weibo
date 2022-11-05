//
//  AppDelegate.swift
//  命名空间练习
//
//  Created by 邵泽俊 on 2017/1/16.
//  Copyright © 2017年 邵泽俊. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow()
        window?.backgroundColor = UIColor.white
        
        //写死的命名空间来创建控制器
//        let nameSpace = "命名空间练习.ViewController"
        
        //动态获取
//        let Space = Bundle.main.infoDictionary?["CFBundleName"] as? String ?? ""
//        let nameSpace = Space + "." + "ViewController"
        
        //抽取CFBundleName
//        let space  = Bundle.main.getSpaceName()
//        let nameSpace = space + "." + "ViewController"
        
        //利用 计算属性 赋值
        let space = Bundle.main.getSpaceName()
        let nameSpace = space + "." + "ViewController"
        
        let clsSpace = NSClassFromString(nameSpace) as? UIViewController.Type
        let cls = clsSpace?.init()
        
        window?.rootViewController = cls
        
        window?.makeKeyAndVisible()
        
        
        
        
        return true
    }

   

}

