//
//  WBMainViewController.swift
//  ZJWeBoTest
//
//  Created by 邵泽俊 on 2017/1/16.
//  Copyright © 2017年 邵泽俊. All rights reserved.
//

import UIKit

class WBMainViewController: UITabBarController {

    
    lazy var composeBtn :UIButton = {
        () -> UIButton in
        let composeBtn = UIButton()
        
        let backNormalImg = UIImage(named: "tabbar_compose_button")
        composeBtn.setBackgroundImage(backNormalImg, for: .normal)
        let backSelectImg = UIImage(named: "tabbar_compose_button_highlighted")
        composeBtn.setBackgroundImage(backSelectImg, for: .selected)
        
        let NormalImg = UIImage(named: "tabbar_compose_icon_add")
        composeBtn.setImage(NormalImg, for: .normal)
        let SelectImg = UIImage(named: "tabbar_compose_icon_add_highlighted")
        composeBtn.setImage(SelectImg, for: .selected)
        composeBtn.sizeToFit()
        return composeBtn
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViewController()
        setupComposeBtn()
       
    }
    
    /*
        * landscape 支持横屏
        * portrait  支持竖屏
        使用代码控制设备的方向，可以在需要的横屏的时候，单独处理！
        设置支持的方向之后，当前的控制器或者自控制器都会准守这个方向
        如果是 播放视频，都是通过modal的方式弹出
     */
    // MARK:- 设置设备方向支持
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask{
        
        return .portrait
        
    }
}


extension WBMainViewController{
    
   
    // MARK:- 添加子控制器
    func setupViewController()  {
        
        //因为访客视图的原因，所以需要修改 传入的字段
        let array : [[String  : Any]] = [
            
                    ["clsName":"HomeViewController","title":"首页","imgName":"tabbar_home","visitorInfo": ["imgName": "","message": "关注一些人，回这里看看有什么惊喜！"]],
                                             
                     ["clsName":"DiscoverViewController","title":"发现","imgName":"tabbar_message_center","visitorInfo": ["imgName": "visitordiscover_image_message","message": "登录后，别人评论你的微博，发给你的消息，都会在这里收到通知"]],
                     
                     ["clsName":"UIViewController"],
                     
                     ["clsName":"MessageViewController","title":"消息","imgName":"tabbar_discover","visitorInfo": ["imgName": "visitordiscover_image_message","message": "登录后，最新，最热微博尽在掌握，不再会与事实潮流擦肩而过"]],["clsName":"ProfileViewController","title":"我","imgName":"tabbar_profile","visitorInfo": ["imgName": "visitordiscover_image_profile","message": "登陆后，你的微博，相册，个人资料会显示在这里，展示给别人"]]
        ]
        
        //测试数据格式 是否正确 /Users/shaozejun
//        (array as NSArray) .write(toFile: "/Users/shaozejun/Desktop/jason.plist", atomically: true)
        var arrayM  = [UIViewController]()
        
        for dict in array {
            arrayM.append(controllers(dict: dict))
            
        }
//        for vc in arrayM {
//            addChildViewController(vc)
//        }
        viewControllers = arrayM
        
    }
    
    // MARK:- 设置中间的撰写按钮
    func setupComposeBtn() -> Void {
        
        let count = CGFloat(childViewControllers.count);
        let w = tabBar.bounds.width / count
        //设置缩进 CGRectInset 正向 向内缩进，负数 向外扩展
        composeBtn.frame = tabBar.bounds.insetBy(dx: 2 * w, dy: 0)
        tabBar.addSubview(self.composeBtn)
        
        composeBtn.addTarget(self, action: #selector(composeStatus), for: .touchUpInside)
        
    }
    
    // MARK:- 设置TabBarItem属性
    func controllers(dict:[String : Any]) -> UIViewController {
        
        guard let clsName = dict["clsName"] as? String, let title = dict["title"] as? String ,let imgName = dict["imgName"] as? String,let visitorDict = dict["visitorInfo"] as? [String : String]
        else {
            
            return UIViewController()
        }
        //获取命名空间
        let spaceName  = Bundle.main.infoDictionary!["CFBundleName"] as? String ?? ""
        let vcName = (spaceName + "." + clsName)
        //转化成控制器类型
        let cls = NSClassFromString(vcName) as?  WBBaseViewController.Type
        
        //初始化控制器
        let clsVC  = cls?.init()
        
        clsVC?.title = title
        //设置控制器的访客视图字典
        clsVC?.visitorInfo = visitorDict
        
        //设置图片的选中
        clsVC?.tabBarItem.image = UIImage(named: imgName)
        clsVC?.tabBarItem.selectedImage = UIImage(named:imgName + "_highlighted")?.withRenderingMode(.alwaysOriginal)
//        self.tabBar.tintColor = UIColor.orange
        
        //设置tabBar标题字体颜色
        clsVC?.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName:UIColor.orange], for: .highlighted)
        clsVC?.tabBarItem.setTitleTextAttributes([NSFontAttributeName:UIFont.systemFont(ofSize: 15)], for: .normal)
        //实例化导航控制器的时候，会调用 push方法，将rootVC 压栈
        let nav = WBNaviViewController(rootViewController: clsVC!)
        
        return nav
    }
    
}


// MARK:- 事件点击
extension WBMainViewController {
    
    func composeStatus() -> Void {
        print("撰写方法")
        
        let vc = UIViewController()
        vc.view.backgroundColor = UIColor.white
        let nav = UINavigationController(rootViewController: vc)
        present(nav, animated: true, completion: nil)
        
        
    }
}
