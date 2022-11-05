//
//  ZJRefreshView.swift
//  Swift-控件刷新
//
//  Created by 邵泽俊 on 2017/3/11.
//  Copyright © 2017年 邵泽俊. All rights reserved.
//

import UIKit

///处理UI界面的显示
class ZJRefreshView: UIView {
    
    //设置 刷新的初始化状态
    var refreshType :DraggingType = .Normal{
        //重写 set方法 重新设置提示的文字和图片
        didSet{
            
            switch refreshType {
            case .Normal:
                JianTouimg.isHidden = false
                activity.stopAnimating()
                tipLabel.text = "正在下拉刷新..."
                JianTouimg.transform = CGAffineTransform.identity
            case .Pulling:
                tipLabel.text = "松手开始刷新..."
                UIView.animate(withDuration: 0.25, animations: { 
                    self.JianTouimg.transform = CGAffineTransform(rotationAngle: CGFloat(M_PI + 0.001))
                })
            case .WillRefresh:
                tipLabel.text = "正在刷新数据..."
                JianTouimg.isHidden = true
                activity.startAnimating()
                
            }
        }
        
    }
    
    
    /// 指示器
    @IBOutlet weak var activity: UIActivityIndicatorView!
    
    /// 提示图片
    @IBOutlet weak var JianTouimg: UIImageView!
    
    /// 提示标签
    @IBOutlet weak var tipLabel: UILabel!
   
    
    class func refreshView() -> ZJRefreshView {
        let nib = UINib(nibName: "ZJRefreshView", bundle: nil)
        return nib.instantiate(withOwner: nil, options: nil)[0] as! ZJRefreshView
        
    }

}
