//
//  KBEmotionPackageModel.swift
//  微博键盘表情
//
//  Created by 邵泽俊 on 2017/3/16.
//  Copyright © 2017年 邵泽俊. All rights reserved.
//

import UIKit

/// TabBar的表情包的model
class KBEmotionPackageModel: NSObject {
    
    //表情包的分组名字
    var groupName : String?
    
    //表情的数组
    lazy var emotcionArray = [KBEmotionModel]()
    
    // 表情包的目录，从目录下下载 info.plist 可以创建 表情model数组
    var directory : String?{
        didSet{
            
            guard let directory = directory else {
                return
            }
            
            guard let path = Bundle.main.path(forResource: "HMEmoticon.bundle", ofType: nil),
                  let bundle = Bundle(path: path),
                  let emotionPath = bundle.path(forResource: "info.plist", ofType: nil, inDirectory: directory),
            let  emotionArray = NSArray(contentsOfFile: emotionPath) as? [[String: String]]
                else{
                return
            }
            
            guard let emotionModelArray = NSArray.yy_modelArray(with: KBEmotionModel.self, json: emotionArray) as? [KBEmotionModel] else{
                return
            }
            //单独设置小图的文件路径
            for model in emotionModelArray {
                
                model.directory = directory
            }
            emotcionArray += emotionModelArray
        }
    }
    
    override var description: String{
        return yy_modelDescription()
    }
}

