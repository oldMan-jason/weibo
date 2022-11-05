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
        
        self.webView.delegate = self;
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

        guard let url = URL(string: urlStr) else{
            return
        }
        let request = URLRequest(url: url)
        self.webView.loadRequest(request)
        
    }
    
}


// MARK:- UIWebViewDelegate
extension OAuthViewController : UIWebViewDelegate {
    
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
      /*
          授权的网页接口
         Optional(https://api.weibo.com/oauth2/authorize?client_id=3480055119&redirect_uri=http://www.baidu.com)
         确认思路：
         1> 如果请求地址包含了 http://www.baidu.com 不再加载页面，否则加载界面出来
         absoluteString 是获取整个url
         query 就是 url中 ‘？’后面的所有部分

      */
        
        if request.url?.absoluteString.hasPrefix(WBRedirectURL) == false {
            return true
        }
        //2> 从 http://www.baidu.com 回调地址中 查询code，获取code，如果有，表示授权成功，否则失败。
        if request.url?.query?.hasPrefix("code") == false {
            print("用户取消授权")
            close()
            return false
        }
        //3> 从字符串中获取授权码
        let code = request.url?.query?.substring(from: "code=".endIndex) ?? ""
        print("获取授权码 --\(code)")

        //4> 使用授权码 获取AccessToken
        WBNetworkManager.share.loadAccessToken(code: code)
        
        
        //返回 false 不执行回调的url
        return false
        
    }
    
    
}




