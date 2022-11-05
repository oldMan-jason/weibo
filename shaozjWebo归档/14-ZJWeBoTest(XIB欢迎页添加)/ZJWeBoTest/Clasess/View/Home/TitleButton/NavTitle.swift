//
//  NavTitle.swift
//  ZJWeBoTest
//
//  Created by 邵泽俊 on 2017/2/15.
//  Copyright © 2017年 邵泽俊. All rights reserved.
//

import UIKit

class NavTitle: UIButton {

    //重载构造函数
    init(title: String?){
        super.init(frame: CGRect())
        
        //1 > 判断title 是否为nil
        if title == nil {
            setTitle("首页", for: .normal)
        }else{
            setTitle(title!, for: .normal)
        //2 > 设置图像
            setImage(UIImage(named: "navigationbar_arrow_down"), for: .normal)
            setImage(UIImage(named: "navigationbar_arrow_up"), for: .selected)
        }
        //3 > 设置字体和颜色
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        setTitleColor(UIColor.orange, for: .normal);
        //4 > 设置大小
        sizeToFit()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //调整按钮的布局
    override func layoutSubviews() {
        //一定要super
        super.layoutSubviews()
        //判断 lable 和 imageView 是否同时存在
        guard let titleLabel = titleLabel,let imageView = imageView else {
            return
        }
        titleLabel.frame = titleLabel.frame.offsetBy(dx: -imageView.bounds.width, dy: 0)
        imageView.frame = imageView.frame.offsetBy(dx: titleLabel.bounds.width, dy: 0)
        
        print("布局调整")
    }
    
}
