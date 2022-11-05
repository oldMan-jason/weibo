//
//  VisitorView.swift
//  ZJWeBoTest
//
//  Created by 邵泽俊 on 2017/1/19.
//  Copyright © 2017年 邵泽俊. All rights reserved.
//

import UIKit


/// 访客视图
class VisitorView: UIView {

    //设置访客视图信息字典 包括 【imageName /  message 】
    var visitorDict :[String: String]? {
        
        didSet{
            guard let imgName = visitorDict?["imgName"],
                  let message = visitorDict?["message"] else {
                  return
            }
            
            tipLable.text = message
            //如果是首页 imgName = ““
            if imgName == "" {
                //首页控制器直接返回
                startAnimation()
                return
            }
                //设置其他的控制器
            iconView.image = UIImage(named: imgName)
            
            //设置其他的访客视图不需要显示
            houseView.isHidden = true
            maskIconView.isHidden = true
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //旋转动画
    func startAnimation() -> Void {
        
        let anim = CABasicAnimation(keyPath: "transform.rotation")
        
        anim.toValue = 2 * M_PI
        anim.repeatCount = MAXFLOAT
        
        anim.duration = 15
        //动画完成不删除，如果iconView被释放，动画也会销毁
        anim.isRemovedOnCompletion = false
        //将动画添加到图层
        iconView.layer .add(anim, forKey: nil)
      
    }
    
    
    // MARK:- 懒加载控件属性
    lazy var iconView : UIImageView = UIImageView(image: UIImage(named: "visitordiscover_feed_image_smallicon"))
    //遮罩
    lazy var maskIconView: UIImageView = UIImageView(image: UIImage(named: "visitordiscover_feed_mask_smallicon"))
    
    lazy var houseView = UIImageView(image: UIImage(named: "visitordiscover_feed_image_house"))
    
    lazy var tipLable :UILabel = {
        
        let lable = UILabel()
        lable.text = "关注一些人，回这里看看有什么惊喜关注一些人，回这里看看有什么惊喜"
        lable.font = UIFont.systemFont(ofSize: 14)
        lable.textColor = UIColor.darkGray
        lable.sizeToFit()
        return lable
    }()
    
    lazy var registerButton : UIButton  = {
        let btn = UIButton()
        btn.setTitle("注册", for: .normal)
        btn.setTitleColor(UIColor.orange, for: .normal)
        btn.setTitleColor(UIColor.black, for: .highlighted)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        let img = UIImage(named: "common_button_white_disable")
        btn.setBackgroundImage(img, for: .normal)
        return btn
    }()
    
    lazy var loginButton : UIButton  = {
        let btn = UIButton()
        btn.setTitle("登录", for: .normal)
        btn.setTitleColor(UIColor.darkGray, for: .normal)
        btn.setTitleColor(UIColor.black, for: .highlighted)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        let img = UIImage(named: "common_button_white_disable")
        btn.setBackgroundImage(img, for: .normal)
        return btn
    }()
}

extension VisitorView{
    
    func setupUI() -> Void {
        
        backgroundColor = UIColor.white
        //1.添加控件
        addSubview(iconView)
        addSubview(maskIconView)
        addSubview(houseView)
        addSubview(tipLable)
        addSubview(registerButton)
        addSubview(loginButton)
        
        //2.取消 autoresizing
        for v in subviews {
            v.translatesAutoresizingMaskIntoConstraints = false
        }
        //3.自动布局
        //图像视图
        /*
         item : 视图
         attribute : 约束属性
         relatedBy : 约束关系
         toItem : 参照对象
         attribute : 参照属性
         multiplier : 乘积
         constant : 约束值
         
         如果 指定控件的宽和高，则参照视图设置为nil，参照属性设置为 .notAnAttribute
         
         NSLayoutConstraint(item: <#T##Any#>, attribute: <#T##NSLayoutAttribute#>, relatedBy: <#T##NSLayoutRelation#>, toItem: <#T##Any?#>, attribute: <#T##NSLayoutAttribute#>, multiplier: <#T##CGFloat#>, constant: <#T##CGFloat#>)
         
         VFL 可视化格式语言
         H 水平方向
         V 垂直方向
         | 边界
         [] 包含控件的名称字符串，对应关系在views 字典中定义
         () 定义控件的宽、高，可以在metrics中指定
        
         NSLayoutConstraint.constraints(withVisualFormat: VLF公式, options: [], metrics: 约束数值字典[String : 数值], views: 视图字典[String : 子视图])
         */

        
        addConstraint(NSLayoutConstraint(item: iconView,
                                         attribute: .centerX,
                                         relatedBy: .equal,
                                         toItem: self,
                                         attribute: .centerX,
                                         multiplier: 1.0,
                                         constant: 0))
        addConstraint(NSLayoutConstraint(item: iconView,
                                         attribute: .centerY,
                                         relatedBy: .equal,
                                         toItem: self,
                                         attribute: .centerY,
                                         multiplier: 1.0,
                                         constant: -60))
        
        //小房子
        addConstraint(NSLayoutConstraint(item: houseView, attribute: .centerX, relatedBy: .equal, toItem: iconView, attribute: .centerX, multiplier: 1.0, constant: 0))
        addConstraint(NSLayoutConstraint(item: houseView, attribute: .centerY, relatedBy: .equal, toItem: iconView, attribute: .centerY, multiplier: 1.0, constant: 0))
       
        //提示文字
        addConstraint(NSLayoutConstraint(item: tipLable, attribute: .centerX, relatedBy: .equal, toItem: iconView, attribute: .centerX, multiplier: 1.0, constant: 0))
        addConstraint(NSLayoutConstraint(item: tipLable, attribute: .top, relatedBy: .equal, toItem: iconView, attribute: .bottom, multiplier: 1.0, constant: 20))
        addConstraint(NSLayoutConstraint(item: tipLable, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 236))
    
         //注册按钮
        addConstraint(NSLayoutConstraint(item: registerButton, attribute: .left, relatedBy: .equal, toItem: tipLable, attribute: .left, multiplier: 1.0, constant: 0))
        addConstraint(NSLayoutConstraint(item: registerButton, attribute: .top, relatedBy: .equal, toItem: tipLable, attribute: .bottom, multiplier: 1.0, constant: 35))
        addConstraint(NSLayoutConstraint(item: registerButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 60))
        
        //登入按钮
        addConstraint(NSLayoutConstraint(item: loginButton, attribute: .right, relatedBy: .equal, toItem: tipLable, attribute: .right, multiplier: 1.0, constant: 0))
        addConstraint(NSLayoutConstraint(item: loginButton, attribute: .top, relatedBy: .equal, toItem: tipLable, attribute: .bottom, multiplier: 1.0, constant: 35))
        addConstraint(NSLayoutConstraint(item: loginButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 60))
        
        
        //设置遮罩 VFL-- metrics : 定义在 VFL中 （） 指定的常常数的映射关系
        let viewDict:[String: AnyObject] = ["maskIconView":maskIconView,"registerButton":registerButton]
        let metrics: [String: Int] = ["spaces": -35]
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[maskIconView]-0-|", options: [], metrics: nil, views: viewDict))
        //直接写值
//      addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[maskIconView]-(-35)-[registerButton]", options: [], metrics: nil, views: viewDict))
        //采用映射关系赋值
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[maskIconView]-(spaces)-[registerButton]", options: [], metrics: metrics, views: viewDict))
        
    }
    
}
