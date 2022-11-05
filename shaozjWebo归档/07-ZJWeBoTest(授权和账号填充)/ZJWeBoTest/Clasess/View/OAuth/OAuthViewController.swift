//
//  OAuthViewController.swift
//  ZJWeBoTest
//
//  Created by 邵泽俊 on 2017/2/9.
//  Copyright © 2017年 邵泽俊. All rights reserved.
/*
    授权登录界面
 */

import UIKit

class OAuthViewController: UIViewController {

    lazy var webView = UIWebView()
    
    override func loadView() {
        view = self.webView
        view.backgroundColor = UIColor.white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "登录微博"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "返回", fontSize: 18, target: self, action: #selector(close), isBack: true)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "自动填充", fontSize: 18, target: self, action: #selector(autofill), isBack: false)

        
        webViewRequest()
    }
    
    // MARK:- 退出
    func close() -> Void {
        dismiss(animated: true, completion: nil)
    }
    // MARK:- 自动填充 直接通过js修改本地浏览器中的缓存页面内容 
    func autofill() -> Void {
        
        let js = "document.getElementById('userId').value = '15803316398';" + "document.getElementById('passwd').value = 'snake1212';"
        
        //让webview执行 js
        self.webView.stringByEvaluatingJavaScript(from: js)
        
        
    }
}

// MARK:- 加载授权界面
extension OAuthViewController{
    
    func webViewRequest() -> Void {
        
        let urlStr = "https://api.weibo.com/oauth2/authorize?client_id=\(WBAPPKEY)&redirect_uri=\(WBRedirectURL)"
    
        print(urlStr)
        
        guard let url = URL(string: urlStr) else{
            return
        }
        let request = URLRequest(url: url)
        
        self.webView.loadRequest(request)
        
    }
    
}





