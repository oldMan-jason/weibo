//
//  UIImageView+WebImg.swift
//  ZJWeBoTest
//
//  Created by 邵泽俊 on 2017/3/2.
//  Copyright © 2017年 邵泽俊. All rights reserved.
//

import SDWebImage


/*
    分离 SDWebImage 加载图片
 */
extension UIImageView{
    /// 隔离sdwebImg
    ///
    /// - Parameters:
    ///   - urlStr: 用户头像字符串
    ///   - placeImg: 站位头像
    ///   - isAvatar: 是否有头像
    func zj_setImage(urlStr: String?,placeImg:UIImage?,isAvatar: Bool) -> Void {

        guard  let urlStr = urlStr, let url = URL(string: urlStr) else {
            image = placeImg
            return
        }
        
        sd_setImage(with: url, placeholderImage: placeImg, options: []) { [weak self](image, _, _, _) in
            
            if isAvatar {
                //设置 用户头像 为圆角
                self?.image = image?.cz_avatarImage(size: self?.bounds.size)
            }
            
        }
        
    }
    
}
