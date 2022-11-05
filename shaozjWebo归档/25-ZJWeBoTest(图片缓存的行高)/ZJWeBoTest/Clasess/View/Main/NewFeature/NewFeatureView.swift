//
//  NewFeatureView.swift
//  ZJWeBoTest
//
//  Created by 邵泽俊 on 2017/2/15.
//  Copyright © 2017年 邵泽俊. All rights reserved.
/*
    新特性界面
 */

import UIKit

class NewFeatureView: UIView {
    
    @IBOutlet weak var scrollView: UIScrollView!
  
    @IBOutlet weak var enterButton: UIButton!
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    @IBAction func enterClick(_ sender: Any) {
        
        removeFromSuperview()
        
    }
    
    // MARK:- Xib加载 视图
    class func newFeatureView() -> NewFeatureView {
        
        let nib  = UINib(nibName: "NewFeatureView", bundle: nil)
        let v = nib.instantiate(withOwner: nil, options: nil)[0] as! NewFeatureView
        
        //指定视图大小
        v.frame = UIScreen.main.bounds
        return v
        
    }
    
    override func awakeFromNib() {
        
        let count = 4
        let rect = UIScreen.main.bounds
        
        for i in 0..<count {
            let imgName = UIImage(named: "new_feature_" + "\(i + 1)")
            let imgView = UIImageView(image: imgName)
            //设置 大小
            imgView.frame = rect.offsetBy(dx:CGFloat(i) * rect.width, dy: 0)
            scrollView.addSubview(imgView)
        }
        //设置 scrollView的属性
        scrollView.contentSize = CGSize(width: CGFloat(count) * rect.width, height: rect.height)
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.bounces = false
        scrollView.isPagingEnabled = true
        enterButton.isHidden = true
        //设置代理
        scrollView.delegate = self
    }
}


extension NewFeatureView : UIScrollViewDelegate{
    
    //滚动减速
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        //滚动到最后一张 删除视图
        let page = Int(scrollView.contentOffset.x / scrollView.bounds.width)
        print(page)
        print("scrollView.subviews.count \(scrollView.subviews.count)")
        //判断是否是最后一页
        if page == scrollView.subviews.count {
           
            removeFromSuperview()
            
        }
        //如果是倒数第二页 就显示 按钮
        enterButton.isHidden = (page != scrollView.subviews.count - 1)
    
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        // 一旦滚动 就隐藏按钮
        enterButton.isHidden = true
        
        //设置 pageControl
        let page = Int(scrollView.contentOffset.x / scrollView.bounds.width)
        pageControl.currentPage = page
      
    }
}
