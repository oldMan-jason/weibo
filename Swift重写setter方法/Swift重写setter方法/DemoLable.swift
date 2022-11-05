//
//  DemoLable.swift
//  Swift重写setter方法
//
//  Created by 邵泽俊 on 2017/1/16.
//  Copyright © 2017年 邵泽俊. All rights reserved.
//

import UIKit

class DemoLable: UILabel {

   //模型 -> 给视图设置模型，有视图自己根据模型的数据，决定显示的内容。
    var p : Person? {
        //利用didset设置UI界面
        didSet{
        
            text = p?.name
        }
        
    }
    
    
    
}
