//
//  UIBarButtonItems+Extensions.swift
//  ZJWeBoTest
//
//  Created by 邵泽俊 on 2017/1/17.
//  Copyright © 2017年 邵泽俊. All rights reserved.
//

import UIKit

extension UIBarButtonItem{
    
    //遍历构造函数
    convenience init(title:String,fontSize:CGFloat = 16,target:AnyObject?,action:Selector,isBack:Bool = false) {
        let btn = UIButton()
        btn.setTitle(title, for: .normal)
        btn.setTitleColor(UIColor.blue, for: .normal)
        btn.setTitleColor(UIColor.orange, for: .highlighted)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: fontSize)
        btn.addTarget(target, action: action, for: .touchUpInside)
        let NorlmalimgName = "navigationbar_back_withtext"
        let selectImgName = "navigationbar_back_withtext_highlighted"
        
        //判断是否是返回按钮
        if isBack {
            let img = UIImage(named: NorlmalimgName)
            let imgSelect = UIImage(named: selectImgName)
            btn.setImage(img, for: .normal)
            btn.setImage(imgSelect, for: .highlighted)
        }

        btn.sizeToFit()
        self.init(customView:btn)
        
    }
    
}
