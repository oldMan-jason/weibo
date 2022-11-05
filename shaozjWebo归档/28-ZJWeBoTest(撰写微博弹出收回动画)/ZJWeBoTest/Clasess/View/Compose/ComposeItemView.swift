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
    
    class func initComposeItemsView(img:UIImage?,title: String?) -> ComposeItemView {
        
        let  nib = UINib(nibName: "ComposeItemView", bundle: nil)
        let  btn = nib.instantiate(withOwner: nil, options: nil)[0] as! ComposeItemView
        btn.composeItemView.image = img
        btn.composeTitleLabel.text = title
        return btn
        
    }
    
}
