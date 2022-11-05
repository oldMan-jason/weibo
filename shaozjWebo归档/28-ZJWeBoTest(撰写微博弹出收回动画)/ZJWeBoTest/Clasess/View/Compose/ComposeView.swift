

import UIKit
import pop

class ComposeView: UIView {

    
    @IBOutlet weak var scrollView: UIScrollView!
    
    /// 返回按钮
    @IBOutlet weak var backBtn: UIButton!
    
    /// 关闭按钮centerX
    @IBOutlet weak var closeBtnCenterXCons: NSLayoutConstraint!
    
    /// 返回按钮centerX
    @IBOutlet weak var backBtnCenterXCons: NSLayoutConstraint!
    
    // MARK:- 视图移除
    @IBAction func closeBtn(_ sender: UIButton) {
        
//        removeFromSuperview()
         decayAnimation()
        
    }
    // MARK:- 返回按钮
    @IBAction func back(_ sender: Any) {
        
        let point = CGPoint(x: 0, y: 0)
        
        scrollView.setContentOffset(point, animated: true)
        closeBtnCenterXCons.constant = 0
        backBtnCenterXCons.constant = 0
        backBtn.isHidden = true
    }
    
    
    /// 按钮数据数组
    let buttonsInfo = [["imageName": "tabbar_compose_idea", "title": "文字", "clsName": "WBComposeViewController"],
                               ["imageName": "tabbar_compose_photo", "title": "照片/视频"],
                               ["imageName": "tabbar_compose_weibo", "title": "长微博"],
                               ["imageName": "tabbar_compose_lbs", "title": "签到"],
                               ["imageName": "tabbar_compose_review", "title": "点评"],
                               ["imageName": "tabbar_compose_more", "title": "更多", "actionName": "clickMore"],
                               ["imageName": "tabbar_compose_friend", "title": "好友圈"],
                               ["imageName": "tabbar_compose_wbcamera", "title": "微博相机"],
                               ["imageName": "tabbar_compose_music", "title": "音乐"],
                               ["imageName": "tabbar_compose_shooting", "title": "拍摄"]]
    
    
    
    // MARK:- 类方法 加载XIB视图
    class func initComposeView() -> ComposeView{
        
        let nib = UINib(nibName: "ComposeView", bundle: nil)
        //xib加载完成，调用awakeframenib
        let v = nib.instantiate(withOwner: nil, options: nil)[0] as! ComposeView
        v.frame = UIScreen.main.bounds
        v.backgroundColor = UIColor.clear
        
        //因为此时 这个地方有尺寸，如果在awakeframenib中调用，此时scrollview中没有大小
        v.setupUI()
        
        return v
    }
    
    // MARK:- 展示视图
    func show() {
        //这个地方是添加在 根控制器的view上面
        guard let rootView = UIApplication.shared.keyWindow?.rootViewController else{
            return
        }
        
        rootView.view.addSubview(self)
        
        //调用动画
        showCurrentAnimation()
        
    }
}


// MARK:- POP显示动画
extension ComposeView{
    //动画显示当前视图
    func showCurrentAnimation() -> Void {
        //1.创建动画
        let animation :POPBasicAnimation  = POPBasicAnimation(propertyNamed: kPOPViewAlpha)
        animation.fromValue = 0
        animation.toValue = 1
        animation.duration = 0.15
        //2.添加动画
        pop_add(animation, forKey: nil)
    
        showButtons()
        
    }
    
    //弹出 buttons
    func showButtons()  {
        //获取scrollview中的第0个视图
        let view = scrollView.subviews[0]
        //遍历view中的所有按钮
        for (i,btn) in view.subviews.enumerated() {
            //1 创建动画
            let anim  : POPSpringAnimation = POPSpringAnimation(propertyNamed: kPOPLayerPositionY)
            
            //2 设置动画偏移的位置
            anim.fromValue = btn.center.y + 400
            anim.toValue = btn.center.y
            
            //3 设置动画属性
            anim.springSpeed = 6 // 弹力速度
            anim.springBounciness = 6 //弹力系数 【0.20】
            
            //4 设置每个按钮的弹出时间
            anim.beginTime = CACurrentMediaTime() + CFTimeInterval(i) * 0.03
            
            //5 添加动画
            btn.layer.pop_add(anim, forKey: nil)
            
        }
    }
}
// MARK:- POP隐藏动画
extension ComposeView{
    
    func decayAnimation() -> Void {
        
        //获取当前的页
        let page = Int(scrollView.contentOffset.x / scrollView.bounds.size.width)
        
        let v = scrollView.subviews[page]
        
        for (i,btn) in v.subviews.enumerated() {
            
            //创建动画
            let anim : POPSpringAnimation = POPSpringAnimation(propertyNamed: kPOPLayerPositionY)
            anim.fromValue = btn.center.y
            anim.toValue = btn.center.y + 400
    
            //设置button的退出视图的时间  (v.subviews.count - i)
            anim.beginTime = CACurrentMediaTime() + CFTimeInterval(v.subviews.count - i) * 0.03
            //添加动画
            btn.layer.pop_add(anim, forKey: nil)
         
            // 监听第0个按钮的动画，是最后一个执行
            if i == 0 {
                anim.completionBlock = {
                    _,_ in
                    
                    let disMissAnim : POPBasicAnimation = POPBasicAnimation(propertyNamed: kPOPViewAlpha)
                    disMissAnim.fromValue = 1
                    disMissAnim.toValue = 0
                    disMissAnim.duration = 0.15
                    self.pop_add(disMissAnim, forKey: nil)
                    self.removeFromSuperview()
                    
                }
            }
        }
    }
}


// MARK:- 视图子控件的添加
extension ComposeView{
    
    func setupUI() -> Void {
       
        //1.强行更新布局， 获取scrollview的frame。
        layoutIfNeeded()
        
        //2 向scrollview中添加 视图
        let rect = scrollView.bounds
        
        let insertX = scrollView.bounds.size.width
        
        //循环添加 view中的 button
        for i  in 0..<2 {
            //3 设置视图的大小为scrollview的大小
            let v = UIView(frame: rect.offsetBy(dx:CGFloat(i) * insertX, dy: 0))
            
            //3 向视图添加按钮
            addButtons(view: v, idx: i * 6)
            
            //4 将试图添加到scrollview上
            scrollView.addSubview(v)
            
            
        }
        
        //设置 scrollview
        scrollView.contentSize = CGSize(width: insertX * 2, height: 0)
        scrollView.bounces = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.isScrollEnabled = false
        
        }
    
    func addButtons(view: UIView,idx : Int) -> Void {
       
        let count = 6
        
        // MARK:-添加控件
        for i in idx..<(idx + count) {
            
            if i >= buttonsInfo.count {
                break
            }
            let dict  = buttonsInfo[i]
            guard let imgName = dict["imageName"] ,let title = dict["title"] else {
                continue
            }
            let  img = UIImage(named: imgName)
            let btn = ComposeItemView.initComposeItemsView(img: img, title: title)
            view.addSubview(btn)
            
            //添加点击更多的 按钮事件 通过映射的关系来监听
            if let actionName = dict["actionName"] {
                
                btn.addTarget(self, action: Selector(actionName), for: .touchUpInside)
            }
        }
        
        let buttonSize = CGSize(width: 100, height: 100)
        let margin = (view.bounds.size.width - (3 * buttonSize.width)) / 4;
        
        // MARK:-布局按钮
        for (i, btn) in view.subviews.enumerated() {
        
            let x = margin + CGFloat(margin + buttonSize.width) * CGFloat(i % 3)
            
            let y = (i > 2) ? (view.bounds.size.height - buttonSize.height) : 0

            btn.frame = CGRect(x: x, y: y, width: buttonSize.width, height: buttonSize.height)
        }
    }
    
    // MARK:- 点击更多
    func clickMore() -> Void {
        //将scrollview滚动到第二页
//       var offset = scrollView.contentOffset
//        offset.x = scrollView.bounds.size.width
//        scrollView.contentOffset = offset
        //改变 scrollview的偏移量
        let point = CGPoint(x: scrollView.bounds.size.width, y: 0)
        scrollView.setContentOffset(point, animated: true)
        
        let margin = scrollView.bounds.size.width / 6
        
        backBtn.isHidden = false
        
        closeBtnCenterXCons.constant = margin
        backBtnCenterXCons.constant = -margin
        
        UIView.animate(withDuration: 0.3) {
            self.layoutIfNeeded()
        }
        
    }
    
}








