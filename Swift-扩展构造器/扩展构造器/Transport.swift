//
//  Transport.swift
//  扩展构造器
//
//  Created by 邵泽俊 on 2017/7/1.
//  Copyright © 2017年 邵泽俊. All rights reserved.
//

import UIKit

typealias protocolMethod = myprotocolfunction & myprotocolfunction1

class Transport: NSObject,protocolMethod {
    
    var scope: String
    var price: Int = 0
    
    init(scope: String) {
        self.scope = scope
    }
    var so = 1
    var num: Int{
        get{
            return so
        }
        set{
            so = newValue + 1
        }
    }
    
    func functionMine1() {
        
    }
    
}
extension Transport {
    
    convenience init(price: Int,scope: String){
        self.init(scope: scope)
        self.price = price
    }
}
