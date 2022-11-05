//
//  MyLable.swift
//  Swift懒加载
//
//  Created by 邵泽俊 on 2017/1/11.
//  Copyright © 2017年 邵泽俊. All rights reserved.
//

import UIKit

class MyLable: UILabel {

    //重写构造函数 
    //纯代码 执行的方法
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    //这个是系统自动帮你生成  使用xib、storyboard 开发的入口
    //提示 ： 所有的uiview及子类在开发时，一旦重写了构造函数，必须要实现 initwithCoder函数，以保证提供两个通道
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupUI()
        //fatalError 如果使用xib 开发 直接崩溃  禁止xib，storyboard 与代码 混编
        fatalError("init(coder:) has not been implemented")
        
    }
    
    private func setupUI(){
        
        
    print("sss")
    }
    
}
