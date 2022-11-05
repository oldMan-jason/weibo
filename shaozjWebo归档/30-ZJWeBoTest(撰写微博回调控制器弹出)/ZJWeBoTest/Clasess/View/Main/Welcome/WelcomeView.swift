//
//  WelcomeView.swift
//  ZJWeBoTest
//
//  Created by 邵泽俊 on 2017/2/15.
//  Copyright © 2017年 邵泽俊. All rights reserved.
//

import UIKit
import SDWebImage

//欢迎界面
class WelcomeView: UIView {

    @IBOutlet weak var iconBottomCons: NSLayoutConstraint!
    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var iconImgView: UIImageView!
    // MARK:- Xib加载 视图
    class func welcomeView() -> WelcomeView {

        let nib  = UINib(nibName: "WelcomeView", bundle: nil)
        let v = nib.instantiate(withOwner: nil, options: nil)[0] as! WelcomeView
        
        //指定视图大小
        v.frame = UIScreen.main.bounds
        return v
        
    }
  // MARK:- 设置头像动画
    // 视图被添加到 window 上，表示视图 已经显示
    override func didMoveToWindow() {
        super.didMoveToWindow()
        /*
            该视图采用的是自动布局来设置的，只是设置了约束，
         -- 当视图被添加到窗口上时，根据父视图的大小，计算约束，更新控件位置。
         -- layoutIfNeeded 会直接按照当前的约束直接更新控件的位置
         -- 执行之后，控件所在位置，就是XIB中 布局的位置
         
         */
        //-----!!!!!!!!!!!!!!!!!
        self.layoutIfNeeded()
        
        iconBottomCons.constant = bounds.size.height - 200
        
        //withDuration 动画持续时间
        //delay 动画延迟时间
        //usingSpringWithDamping 弹力系数
        //initialSpringVelocity 初速度
        UIView.animate(withDuration: 3, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0, options: .allowAnimatedContent, animations: { 
            //更新约束
            self.layoutIfNeeded()
        }) { (_) in
            //让titleLable 慢慢显示出来
            UIView.animate(withDuration: 1, animations: { 
                
                self.titleLable.alpha = 1
                
            }, completion: { (_) in
                //移除view
                self.removeFromSuperview()
            })
            
        }
    }
    // MARK:- 设置用户的头像数据
    override func awakeFromNib() {
        
        guard let urlStr = WBNetworkManager.share.userConfig.avatar_large,let url = URL(string: urlStr) else {
                return
        }
        iconImgView.sd_setImage(with: url, placeholderImage: UIImage(named: "avatar_default"))
        iconImgView.layer.masksToBounds = true
        iconImgView.layer.cornerRadius = iconImgView.bounds.width * 0.5
        
    }

    // 自动布局系统更新完成约束后，会自动调用此方法，通常是对子视图进行布局，一定要调用父类的方法
    //    override func layoutSubviews() {
    //     super.layoutSubviews()
    //
    //    }
    
    //init?(coder aDecoder）只是刚从xib的二进制文件 将视图数据加载完成
    //还没有和代码连线建立关系，所以开发中，千万不要再 这个方法中设置UI
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//        
//    }
    
}
