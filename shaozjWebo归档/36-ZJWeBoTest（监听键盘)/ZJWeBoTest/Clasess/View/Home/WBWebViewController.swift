//
//  WBWebViewController.swift
//  ZJWeBoTest
//
//  Created by 邵泽俊 on 2017/3/20.
//  Copyright © 2017年 邵泽俊. All rights reserved.
//

import UIKit

class WBWebViewController: WBBaseViewController {
    
    private lazy var webView = UIWebView(frame: UIScreen.main.bounds)
    
    var urlString: String? {
        
        didSet{
            guard let urlString = urlString , let url = URL(string: urlString)
                else { return  }
            
            webView.loadRequest(URLRequest(url: url))
        }
    }

    override func setupTableView() {
        
        navItem.title = "网页"
        view.insertSubview(webView, belowSubview: navigationBar)
        navItem.leftBarButtonItem = UIBarButtonItem(title: "取消", target: self, action: #selector(dismissVC))
        
    }
    func dismissVC() -> Void {
        dismiss(animated: true, completion: nil)
        
    }

}


