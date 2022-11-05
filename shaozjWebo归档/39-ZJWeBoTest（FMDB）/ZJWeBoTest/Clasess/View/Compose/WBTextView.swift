//
//  WBTextView.swift
//  ZJWeBoTest
//
//  Created by 邵泽俊 on 2017/3/21.
//  Copyright © 2017年 邵泽俊. All rights reserved.
/*
    自定义textView
 */

import UIKit

class WBTextView: UITextView {

    private lazy var placeLabel = UILabel()
    
    
    //发布的字符串
    var emtionStr:String {
        
        guard  let attributedStr = attributedText else{
            return ""
        }
        let range = NSRange(location: 0, length: attributedStr.length)
        var resultStr = String()
        
        attributedStr.enumerateAttributes(in: range, options: []) { (dict, rg, _) in
            if let attachment = dict["NSAttachment"] as? KBTextAttachment{
                resultStr += attachment.chs ?? ""
                
            }else{
                let subStr = (attributedStr.string as NSString).substring(with: rg)
                resultStr += subStr
            }
        }
        return resultStr
    }
    
    override func awakeFromNib() {
        setupUI()
        
        NotificationCenter.default.addObserver(self, selector: #selector(textViewchange), name: .UITextViewTextDidChange, object: self)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    func textViewchange() -> Void {
        //如果有文本，不显示占位符，否则显示
        placeLabel.isHidden = self.hasText
    }
    
    // MARK:-插入表情
    func insertTextViewEmotion(em: KBEmotionModel?) -> Void {
        
        if em == nil {//删除文本
            deleteBackward()
            return
        }else{//插入emoji文本
            if let emStr = em?.emojiStr,let textRange = selectedTextRange{
                replace(textRange, withText: emStr)
                return
            }
            //插入类型为图片
            //1. 获取当前模型的 属性文本
            guard let imgTextArr = em?.imageText(font: font!) else{
                return
            }
            //2 赋值一份 textView的属性文本
            let attrStrM = NSMutableAttributedString(attributedString: attributedText)
            //3 记录range
            let range = selectedRange
            attrStrM.replaceCharacters(in: selectedRange, with: imgTextArr)
            //4 重新赋值给textview
            attributedText = attrStrM
            //5 修改光标
            selectedRange = NSRange(location: range.location + 1, length: 0)
            
            // 4> 让代理执行文本变化方法 - 在需要的时候，通知代理执行协议方法！
            delegate?.textViewDidChange?(self)
            
            // 5> 执行当前对象的 文本变化方法
            textViewchange()

        }
        
        
    }

    
    func setupUI() -> Void {
        //设置占位符
        placeLabel.text = "分享新鲜事..."
        placeLabel.font = self.font
        placeLabel.textColor = UIColor.lightGray
        placeLabel.frame = CGRect(x: 5, y: 10, width: 0, height: 0)
        placeLabel.sizeToFit()
        addSubview(placeLabel)
    
    }

}
