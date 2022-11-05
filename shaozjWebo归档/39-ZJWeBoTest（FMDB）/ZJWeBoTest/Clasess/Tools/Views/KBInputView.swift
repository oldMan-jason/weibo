

/*键盘的 inputview*/

import UIKit

//表示符号
private let cellID = "cellid"

class KBInputView: UIView {
    
    
    @IBOutlet weak var toolBar: UIView!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    ///闭包回调
    var didSelectedEmotionBlock: ((_ emo: KBEmotionModel?)->())?
    
    // MARK:- 实例化
    //类方法 中记录闭包需要 需要使用对象记录
    class func setupInputView(selectedBlock: @escaping (_ em: KBEmotionModel?)->()) -> KBInputView {
        
        let nib  = UINib(nibName: "KBInputView", bundle: nil)
        let v = nib.instantiate(withOwner: nil, options: nil).last as! KBInputView
        //对象记录block
        v.didSelectedEmotionBlock = selectedBlock
        
        return v
        
        
    }
    // MARK:- cell注册
    override func awakeFromNib() {
        
        collectionView.register(KBEmotionCell.self, forCellWithReuseIdentifier: cellID)
    }
}

extension KBInputView: UICollectionViewDataSource{
    
    
    //每一个表情包的分类个数
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return KBEmotionManager.shareEmotion.packageArray.count
    }
    
    //每一个表情包分类中的页数，每一页表情的个数 （20） emotionarray / 20
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return KBEmotionManager.shareEmotion.packageArray[section].emotionCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! KBEmotionCell
//        cell.backgroundColor = UIColor(red: CGFloat(arc4random_uniform(255))/CGFloat(255.0), green: CGFloat(arc4random_uniform(255))/CGFloat(255.0), blue: CGFloat(arc4random_uniform(255))/CGFloat(255.0), alpha: 1)
        //传递model
        cell.emArray = KBEmotionManager.shareEmotion.packageArray[indexPath.section].emotionSubArray(page: indexPath.item)
        //设置代理
        cell.cellDelegate = self
        return cell
        
    }
}

extension KBInputView : EmotionDidSelectedDelegate{
    
    func emotionCellDidSelected(cell: KBEmotionCell, emodel: KBEmotionModel?) {
        
       didSelectedEmotionBlock?(emodel)
    }
    
}
