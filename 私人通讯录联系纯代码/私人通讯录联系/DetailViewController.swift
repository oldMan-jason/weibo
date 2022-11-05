//
//  DetailViewController.swift
//  私人通讯录联系
//
//  Created by 邵泽俊 on 2017/1/14.
//  Copyright © 2017年 邵泽俊. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var p : Person?
    
    var dataReturn :(()->())?
    
    lazy var nameTextFiled :UITextField = {
        
        let name = UITextField(frame: CGRect(x: 30, y: 80, width: UIScreen.main.bounds.size.width - 60, height: 50))
        name.placeholder = "请输入姓名"
        return name
    
    }()
    lazy var numberTextFiled :UITextField = {
        
        let name = UITextField(frame: CGRect(x: 30, y: 140, width: UIScreen.main.bounds.size.width - 60, height: 50))
        name.placeholder = "请输入手机号"
        return name
        
    }()
    
    lazy var saveItem : UIBarButtonItem = {
        
        let save = UIButton (frame: CGRect(x: 0, y: 0, width: 30, height: 20))
        save.setTitle("保存", for: .normal)
        save.sizeToFit()
        save.setTitleColor(UIColor.blue, for: .normal)
        save.addTarget(self, action: #selector(saveMessage), for: .touchUpInside)
        let saveItem = UIBarButtonItem(customView: save)
        return saveItem
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "编辑联系人"
        view.backgroundColor = UIColor.white
        self.navigationItem.rightBarButtonItem = self.saveItem
        view.addSubview(self.nameTextFiled)
        view.addSubview(self.numberTextFiled)
        
        if self.p != nil {
            self.nameTextFiled.text = p?.name
            self.numberTextFiled.text = p?.number
        }
    }

    func saveMessage() -> Void {
        print("baocun")
        
        if self.p == nil {
            self.p = Person()
        }
        
        p?.name = nameTextFiled.text
        p?.number = numberTextFiled.text
        
        self.dataReturn?()
        
       _ = self.navigationController?.popViewController(animated: true)
        
    }
   
}
