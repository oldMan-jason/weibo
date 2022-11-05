

import UIKit
import YYModel

// MARK:- 表情管理器
class KBEmotionManager{
    
    //为了便于表情的复用,建立单利，只加载一次表情数据
    static let shareEmotion = KBEmotionManager()
    
    //表情包的数组
    lazy var packageArray = [KBEmotionPackageModel]()

    //构造函数，如果在 init 之前增加 private 修饰符，可以要求调用者必须听过shareEmotion访问对象
    private init() {
     
        readEmotion()
    }
}

// MARK:- 将给定的字符串转化成属性文本
extension KBEmotionManager{
    
    /// 将给定的字符串转化成属性文本
    /// - Parameter string: 完整的字符串
    /// - Returns: 属性文本
    func emoiconString(string: String,font: UIFont) -> NSAttributedString {
        
        let attr = NSMutableAttributedString(string: string)
        
        //1. 建立正则表达式，过滤所有的表情文字
        let pattern = "\\[.*?\\]"
        
        guard let regx = try? NSRegularExpression(pattern: pattern, options: []) else{
            return attr
        }
        //2. 匹配所有的项
        let matchesResult = regx.matches(in: attr.string, options: [], range: NSRange(location: 0, length: attr.length))
        
        //3 获取rang,此处必须要反序列化遍历，因为正序遍历之后，后面的文字的rang属性（位置，长度都发生改变）
        for match in matchesResult.reversed() {
            
            let r = match.rangeAt(0)
            
            let str = (attr.string as NSString).substring(with: r)
            
            //根据表情文字 来查询 表情符号
            if let checkEm = KBEmotionManager.shareEmotion.findEmotion(string: str){
                //根据表情符号生成一个 表情的副本
                let emAttr = checkEm.imageText(font: font)
                //替换成表情副本
                attr.replaceCharacters(in: r, with: emAttr)
            }
        }
        
        //4 统一设置文字字体的大小
//        attr.addAttributes([NSFontAttributeName: font], range: NSRange(location: 0, length: attr.length))
        
        return attr
    }

}

extension KBEmotionManager{
    
    //加载TabBar的plist文件
    func readEmotion() -> Void {

        guard let path = Bundle.main.path(forResource: "HMEmoticon.bundle", ofType: nil),
            let bundle = Bundle(path: path),
            let plistPath = bundle.path(forResource: "emoticons.plist", ofType: nil),
            let plistArray = NSArray(contentsOfFile: plistPath) as? [[String: String]]
            else{
            return
        }
        //通过yy_model 直接将 字典数组 转化成 KBEmotionPackageModel
        guard let modelArray = NSArray.yy_modelArray(with: KBEmotionPackageModel.self, json: plistArray) as? [KBEmotionPackageModel] else{
            return
        }
        packageArray += modelArray
    }
    
    
    //方法一：根据字符串查询一个表情
//    func findEmotion(string: String) -> KBEmotionModel? {
//        for em in packageArray {
//            
//            for em2 in em.emotcionArray {
//                
//                if em2.chs == string {
//                    return em2
//                }
//            }
//        }
//        return nil
//    }
    
    //方法二：根据字符串查询一个表情
    func findEmotion(string: String) -> KBEmotionModel? {
        
        //1> 遍历表情包
        for em in packageArray {
            
            //2> 在表情组中过滤 string
//            let array = em.emotcionArray.filter({ (model) -> Bool in
//                return model.chs == string
//            })
            //尾随闭包1
//            let array = em.emotcionArray.filter(){ (model) -> Bool in
//                return model.chs == string
//            }
            //尾随闭包2 如果尾随闭包中只有一句，并且是返回，闭包格式定义可以省略，参数省略之后，使用$0,$1...一次替代原来的参数
//            let array = em.emotcionArray.filter(){
//                return $0.chs == string
//            }
            //尾随闭包3
            let array = em.emotcionArray.filter(){
                 $0.chs == string
            }
            
            //3> 判断结果数组的数量
            if array.count == 1 {
                return array[0]
            }
        }
        return nil
    }
}
