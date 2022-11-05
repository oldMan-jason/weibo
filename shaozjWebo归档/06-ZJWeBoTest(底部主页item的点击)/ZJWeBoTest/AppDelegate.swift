//
//  AppDelegate.swift
//  ZJWeBoTest
//
//  Created by 邵泽俊 on 2017/1/16.
//  Copyright © 2017年 邵泽俊. All rights reserved.
//

import UIKit

import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
   
        //取得用户授权 显示通知【上方的提示条，声音，BadgeNumber】
        /*
         废弃的方法
         
         */
        // #available 检测设备的版本
        // iOS10.0 以上的方法
        if #available(iOS 10.0, *) {
            UNUserNotificationCenter.current().requestAuthorization(options: [.sound,.badge,.alert,.carPlay]) { (AuthorSucess, error) in
                print("授权成功")
            }
        }else{
            // iOS10.0以下 获取用户授权
            let notificationSetting = UIUserNotificationSettings(types: [.alert,.sound,.badge], categories: nil)
            application.registerUserNotificationSettings(notificationSetting)
        }
        
        
        
        
//        sleep(2)
        window = UIWindow()
        
        window?.backgroundColor = UIColor.white
        
        window?.rootViewController = WBMainViewController()

        window?.makeKeyAndVisible()
        
        return true
    }

   
   


}

