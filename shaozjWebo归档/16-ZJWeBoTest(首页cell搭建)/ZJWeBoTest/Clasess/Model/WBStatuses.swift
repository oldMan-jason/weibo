//
//  WBStatuses.swift
//  ZJWeBoTest
//
//  Created by 邵泽俊 on 2017/2/7.
//  Copyright © 2017年 邵泽俊. All rights reserved.
//

import UIKit


/// 使用YYModel
import YYModel

class WBStatuses: NSObject {

    var id: Int64 = 0
    var text : String?
    
    
    //重写 description的计算型属性
    override var description: String{
        
        print(yy_modelDescription())
        
        return yy_modelDescription()
    }
    
    
    
}


