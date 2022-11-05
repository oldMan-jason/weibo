//
//  AddContactViewController.swift
//  ZJWeBoTest
//
//  Created by 邵泽俊 on 2017/1/17.
//  Copyright © 2017年 邵泽俊. All rights reserved.
//

import UIKit

class AddContactViewController: WBBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
    func pushVC() -> Void {
        let pushVC = AddContactViewController()
        let titlepush = (navigationController?.childViewControllers.count) ?? 0
        pushVC.title = "第\(titlepush)个"
        navigationController?.pushViewController(pushVC, animated: true)
    }
}

extension AddContactViewController{
    
    
    
    
    override func setUpUI() {
        super.setUpUI()
        
        let rightItem  = UIBarButtonItem(title: "下一个", target: self, action: #selector(pushVC))
        navItem.rightBarButtonItem = rightItem
    
    }
}
