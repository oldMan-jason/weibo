//
//  ViewController.swift
//  Swift-KVC(属性)
//
//  Created by 邵泽俊 on 2017/1/8.
//  Copyright © 2017年 邵泽俊. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let p  = Person(dict: ["name":"szj"])
        print(p.name)

    }


}

