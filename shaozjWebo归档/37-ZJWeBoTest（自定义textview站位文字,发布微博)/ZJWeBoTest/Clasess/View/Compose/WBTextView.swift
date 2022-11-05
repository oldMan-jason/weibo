//
//  WBTextView.swift
//  ZJWeBoTest
//
//  Created by 邵泽俊 on 2017/3/21.
//  Copyright © 2017年 邵泽俊. All rights reserved.
/*
    自定义textView
 */

import UIKit

class WBTextView: UITextView {

    private lazy var placeLabel = UILabel()
    
    override func awakeFromNib() {
        setupUI()
        
        NotificationCenter.default.addObserver(self, selector: #selector(textViewchange), name: .UITextViewTextDidChange, object: self)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    func textViewchange() -> Void {
        //如果有文本，不显示占位符，否则显示
        placeLabel.isHidden = self.hasText
    }
    
    func setupUI() -> Void {
        //设置占位符
        placeLabel.text = "分享新鲜事..."
        placeLabel.font = self.font
        placeLabel.textColor = UIColor.lightGray
        placeLabel.frame = CGRect(x: 5, y: 10, width: 0, height: 0)
        placeLabel.sizeToFit()
        addSubview(placeLabel)
    
    }

}
