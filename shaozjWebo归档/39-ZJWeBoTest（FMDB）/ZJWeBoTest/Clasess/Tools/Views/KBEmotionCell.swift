

import UIKit

/// 点击每一个小表情的 协议代理
@objc protocol EmotionDidSelectedDelegate: NSObjectProtocol {
    
   @objc func emotionCellDidSelected(cell: KBEmotionCell,emodel: KBEmotionModel?)
    
}


//表情的 页面 cell
// 每一个cell和collectionview一样大，九宫格放20个表情
class KBEmotionCell: UICollectionViewCell {
    
    //放大显示view
    lazy var tipView: KBTipView = KBTipView()
    
    weak var cellDelegate : EmotionDidSelectedDelegate?

    //CEll复用注意点！！！！！！！
    //当前表情数组
    var emArray : [KBEmotionModel]?{
        didSet{
           print("--传递的个数--\(emArray?.count)")
           //首先隐藏所有的按钮
            for v in contentView.subviews{
                v.isHidden = true
            }
            //显示删除按钮
            contentView.subviews.last?.isHidden = false
            
            //遍历数组，展示button
            for (i,em) in (emArray ?? []).enumerated(){
              //去除按钮
                if let btn = contentView.subviews[i] as? UIButton{
                    // 设置图像 - 如果图像为nil，会清空，避免复用
                    btn.setImage(em.img, for: .normal)
                    //设置 emoji 的字符串
                    btn.setTitle(em.emojiStr, for: .normal)
                    btn.isHidden = false
                }
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }
    
    override func willMove(toWindow newWindow: UIWindow?) {
        super.willMove(toWindow: newWindow)
        
        addSubview(tipView)
    }
}

extension KBEmotionCell{
    
    /// 循环创建20个按钮
    func setupUI() -> Void {
        
        //xib 加载 cell cell的大小 就是 xib的大小
        //纯代码加载cell 就是在layout中设置的itemSize大小
        
        let col = 7
        let row = 3
        let margin : CGFloat = 8
        let bottomMargin : CGFloat = 16
        let  w = (bounds.size.width - 2 * margin) / CGFloat(col)
        let h = (bounds.size.height - bottomMargin) / CGFloat(row)
        
        for i in 0..<21 {
            
            let btn = UIButton()
            btn.frame = CGRect(x:CGFloat(i % col) * w, y: CGFloat(i / col) * h, width: w, height: h)
            
//            btn.backgroundColor = UIColor(red: CGFloat(arc4random_uniform(255))/CGFloat(255.0), green: CGFloat(arc4random_uniform(255))/CGFloat(255.0), blue: CGFloat(arc4random_uniform(255))/CGFloat(255.0), alpha: 1)
            
            btn.titleLabel?.font = UIFont.systemFont(ofSize: 32)
            contentView.addSubview(btn)
            //设置tag 0~20
            btn.tag = i
            //设置按钮的监听事件
            btn.addTarget(self, action: #selector(emotionClick(btn:)), for: .touchUpInside)
        }
        
        //单独设置删除按钮
        let imgName = "compose_emotion_delete"
        let imgNameHL = "compose_emotion_delete_highlighted"
        let removeBtn = contentView.subviews.last as! UIButton
        let img = UIImage(named: imgName, in: KBEmotionManager.shareEmotion.bundle, compatibleWith: nil)
        let imgHL = UIImage(named: imgNameHL, in: KBEmotionManager.shareEmotion.bundle, compatibleWith: nil)
      
        removeBtn.setImage(img, for: .normal)
        removeBtn.setImage(imgHL, for: .highlighted)
        
        //添加长安手势按钮
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(longGesture(gesture:)))
        longPress.minimumPressDuration = 0.1
        addGestureRecognizer(longPress)
        
    }
}

// MARK:- 表情按钮的监听方法
extension  KBEmotionCell{
    
    func emotionClick(btn: UIButton) -> Void {
     
        //去除tag
        let tag = btn.tag
        
        //判断是否是删除按钮
        if tag < (emArray?.count)! {
            let em = emArray?[tag]
            cellDelegate?.emotionCellDidSelected(cell: self, emodel: em)
            
        }else{
            cellDelegate?.emotionCellDidSelected(cell: self, emodel: nil)
        }
    }
    
    func longGesture(gesture: UILongPressGestureRecognizer) -> Void {
        
    }
}
