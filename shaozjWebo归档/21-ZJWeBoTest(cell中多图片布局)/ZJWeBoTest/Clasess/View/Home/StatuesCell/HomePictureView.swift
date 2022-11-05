//
//  HomePictureView.swift
//  ZJWeBoTest
//
//  Created by 邵泽俊 on 2017/3/2.
//  Copyright © 2017年 邵泽俊. All rights reserved.
//

import UIKit
/*
    布局 配图内部的图片
 */
class HomePictureView: UIView {
    
    @IBOutlet weak var pictureHeight: NSLayoutConstraint!

    // MARK:- 设置图片数据
    var urlsModelArray : [WBHomePicture]?{
        
        didSet{
           //1 隐藏所有的imageView
            for v in subviews{
                v.isHidden = true
            }
            var index = 0
            for urlModel in urlsModelArray ?? [] {
                //根据索引 取出 imageView
                let imgVc = subviews[index] as! UIImageView
                
                //处理4张 跳过 第三个 imgVC
                if index == 1 && urlsModelArray?.count == 4 {
                    index += 1
                }
                
                imgVc.zj_setImage(urlStr: urlModel.thumbnail_pic, placeImg: nil, isAvatar: false)
                imgVc.isHidden = false
                index += 1
            }
        }
    }

    override func awakeFromNib() {
        
        setupUI()
    }
}



// MARK: - cell中所有的控件都是提前准备好，设置的时候，根据数据决定是否显示，不要动态创建控件
extension HomePictureView{
    
    func setupUI() -> Void {
        
        
        backgroundColor = superview?.backgroundColor
        
        // 没有的话 直接裁剪掉
        clipsToBounds = true
        
        let count = 3
        //设置初始化坐标
        let rect  = CGRect(x: wbstatusPictureInnerMatgin, y: wbstatusPictureOutterMargin, width: wbstatusPictureItemWidth, height: wbstatusPictureItemWidth)
        
        // 循环创建九宫格
        for i in 0..<count * count {
            let iv = UIImageView()
            
            iv.contentMode = .scaleAspectFit
            iv.clipsToBounds = true
            //行
            let row = CGFloat( i / count)
            //列
            let col = CGFloat( i % count)
            //x坐标
            let x  = col * (wbstatusPictureInnerMatgin + wbstatusPictureItemWidth)
            //y坐标
            let y = row * (wbstatusPictureInnerMatgin + wbstatusPictureItemWidth)
            
            iv.frame = rect.offsetBy(dx: x, dy: y)
            
            addSubview(iv)
        }
        
        
    }
    
}
