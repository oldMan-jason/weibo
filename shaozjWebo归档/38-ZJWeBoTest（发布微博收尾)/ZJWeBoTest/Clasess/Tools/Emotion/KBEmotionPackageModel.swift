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
    
    var bgImageName : String?
    
    //表情的数组
    lazy var emotcionArray = [KBEmotionModel]()
    
    //每一组 cell个数
    var emotionCount : Int{
        return (emotcionArray.count - 1) / 20 + 1
    }
    
    //根据emotionCount 来截取emotcionArray对应的20个表情model给cell 
    func emotionSubArray(page: Int) -> [KBEmotionModel] {
        
        let count = 20
        let loc = page * count
        var length : Int = 0
        //判断越界
        if  emotcionArray.count - loc >= count {
            length = count
        }else{
            length = emotcionArray.count - loc
        }        
        let range = NSRange(location: 0, length: length)
        
        let subArray = (emotcionArray as NSArray).subarray(with: range) as! [KBEmotionModel]
        
        return subArray

    }
    
    
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

