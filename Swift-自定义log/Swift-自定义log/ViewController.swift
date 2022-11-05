//
//  ViewController.swift
//  Swift-自定义log
//
//  Created by 邵泽俊 on 2016/11/28.
//  Copyright © 2016年 邵泽俊. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        ZJLog(message: "自定义打印")
        
    }
    override func viewWillAppear(_ animated: Bool) {
        ZJLog(message: 123)
    }
    

    

}

