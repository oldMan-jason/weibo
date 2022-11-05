//
//  KBCollectionLayout.swift
//  微博键盘表情
//
//  Created by 邵泽俊 on 2017/3/23.
//  Copyright © 2017年 邵泽俊. All rights reserved.
//

import UIKit

/// 表情集合布局
class KBCollectionLayout: UICollectionViewFlowLayout {

    override func prepare() {
        super.prepare()
        //设置滚动方向
        // 水平滚动 垂直布局，如果垂直滚动，水平布局
        scrollDirection = .horizontal
        
        //此时这个地方 可以获取到collectionview的大小
        guard let collectionView = collectionView else {
            return
        }
        
        itemSize = collectionView.bounds.size
        
        minimumLineSpacing = 0
        minimumInteritemSpacing = 0
        
    }
}
