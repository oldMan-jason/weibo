

import UIKit

class KBTipView: UIImageView {
    
    init() {
        
        let bundle = KBEmotionManager.shareEmotion.bundle
        let img = UIImage(named: "emoticon_keyboard_magnifier", in: bundle, compatibleWith: nil)
        super.init(image: img)
        
        //设置锚点
        layer.anchorPoint = CGPoint(x: 0.5, y: 1.2)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
