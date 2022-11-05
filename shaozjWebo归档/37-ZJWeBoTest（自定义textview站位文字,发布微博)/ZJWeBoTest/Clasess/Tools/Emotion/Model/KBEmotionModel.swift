//
//  KBEmotionModel.swift
//  微博键盘表情
//
//  Created by 邵泽俊 on 2017/3/16.
//  Copyright © 2017年 邵泽俊. All rights reserved.
//

import UIKit
import YYModel


/// 每一个表情的model
class KBEmotionModel: NSObject {
    
    // 表情类型  false ： 图片表情， true： emoji
    var type : Bool = false
    
    //表情字符串,发送给新浪服务器
    var chs : String?
     
    //表情图片名称，用于本地的图文混排
    var png : String?
    
    //emoji的十六进制编码
    var code: String?
    
    //因为无法直接直接获取到图片，所以需要一个文件的路径
    var directory: String?
    
    //给表情图片增加目录的 一个路径
    var img : UIImage?{
    
        if type {
            return nil
        }
        guard let directory = directory else { return nil }
        guard let  path = Bundle.main.path(forResource: "HMEmoticon.bundle", ofType: nil),
              let bundle = Bundle(path: path),
              let png = png
        else {
            return nil
        }
        let img = UIImage(named: "\(directory)/\(png)", in: bundle, compatibleWith: nil)
        return img
    }
    
    
    //根据一个图片直接生成一个带图片的文本标签
    func imageText(font: UIFont) -> NSAttributedString {
        
        //1> 首先判断图片是否存在
        guard let img = img else { return  NSAttributedString(string:"")}
        
        //2> 创建文本附件
        let attachment = NSTextAttachment()
        
        //3> 图片的赋值
        attachment.image = img
        let height = font.lineHeight
        attachment.bounds = CGRect(x: 0, y: -4, width: height, height: height)
        
        //4> 返回文本样式
        return  NSAttributedString(attachment: attachment)

    }
    
    override var description: String{
        return yy_modelDescription()
    }
    
    
    
    
    
}
