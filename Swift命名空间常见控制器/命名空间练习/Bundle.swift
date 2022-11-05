//
//  Bundle.swift
//  命名空间练习
//
//  Created by 邵泽俊 on 2017/1/16.
//  Copyright © 2017年 邵泽俊. All rights reserved.
//

import Foundation

extension Bundle{
    
    func getSpaceName() -> String {
        return Bundle.main.infoDictionary?["CFBundleName"] as? String ?? ""
    }
    
    var nameSpace: String {
        
        return Bundle.main.infoDictionary?["CFBundleName"] as? String ?? ""
    }
    
    
}
