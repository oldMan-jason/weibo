//
//  KBToolBar.swift
//  微博键盘表情
//
//  Created by 邵泽俊 on 2017/3/22.
//  Copyright © 2017年 邵泽俊. All rights reserved.

/*表情键盘底部工具条*/

import UIKit

class KBToolBar: UIView {
    
    override func awakeFromNib() {
        
        setupUI()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let w = self.bounds.size.width / 4
        let h = self.bounds.size.height
        
        let rect = CGRect(x: 0, y: 0, width: w, height: h)
       
        for (i,btn) in self.subviews.enumerated() {
            
            btn.frame = rect.offsetBy(dx: CGFloat(i) * w, dy: 0)
        }
    }
}

extension KBToolBar{
    
    
    func setupUI() -> Void {
        
        let share = KBEmotionManager.shareEmotion
        for p in share.packageArray {
            let btn = UIButton()
            btn.setTitle(p.groupName, for: .normal)
            btn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
            
            btn.setTitleColor(UIColor.white, for: .normal)
            btn.setTitleColor(UIColor.darkGray, for: .highlighted)
            btn.setTitleColor(UIColor.darkGray, for: .selected)
            
            //设置按钮的图像
            let imageName = "compose_emotion_table_\(p.bgImageName ?? "")_normal"
            let imageSelcted = "compose_emotion_table_\(p.bgImageName ?? "")_selected"
            
            var img = UIImage(named: imageName, in: share.bundle, compatibleWith: nil)
            var imgS = UIImage(named: imageSelcted, in: share.bundle, compatibleWith: nil)
            
            //拉伸图像
            let size = img?.size ?? CGSize()
            let resize = UIEdgeInsets(top: size.height * 0.5, left: size.width * 0.5, bottom: size.height * 0.5, right: size.width * 0.5)
            //拉伸
            img = img?.resizableImage(withCapInsets: resize, resizingMode: .stretch)
            imgS = imgS?.resizableImage(withCapInsets: resize, resizingMode: .stretch)
            
            btn.setBackgroundImage(img, for: .normal)
            btn.setBackgroundImage(imgS, for: .selected)
            btn.setBackgroundImage(imgS, for: .highlighted)
            
            btn.sizeToFit()
            
            addSubview(btn)
            
        }
    }
}
