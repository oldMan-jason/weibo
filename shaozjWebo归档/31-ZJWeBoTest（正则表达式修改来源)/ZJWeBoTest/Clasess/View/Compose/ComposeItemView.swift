//
//  ComposeItemView.swift
//  ZJWeBoTest
//
//  Created by 邵泽俊 on 2017/3/13.
//  Copyright © 2017年 邵泽俊. All rights reserved.

/* 自定义 UIButton */

import UIKit

class ComposeItemView: UIControl {

    @IBOutlet weak var composeItemView: UIImageView!
    
    @IBOutlet weak var composeTitleLabel: UILabel!
    
    ///设置 点击按钮的 类型,目的是区分点击事件
    var btnClassName : String?
    
    class func initComposeItemsView(img:UIImage?,title: String?) -> ComposeItemView {
        let  nib = UINib(nibName: "ComposeItemView", bundle: nil)
        let  btn = nib.instantiate(withOwner: nil, options: nil)[0] as! ComposeItemView
        btn.composeItemView.image = img
        btn.composeTitleLabel.text = title
        return btn
        
    }
    
}
