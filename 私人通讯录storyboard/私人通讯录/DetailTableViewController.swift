//
//  DetailTableViewController.swift
//  私人通讯录
//
//  Created by 邵泽俊 on 2017/1/14.
//  Copyright © 2017年 邵泽俊. All rights reserved.
//

import UIKit

class DetailTableViewController: UITableViewController {

    var person : Person?
    //定义闭包 这个是可选的
    var CallBack :(()->())?

    
    @IBOutlet weak var nameFiled: UITextField!
    @IBOutlet weak var phoneField: UITextField!
    @IBOutlet weak var titleFiled: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       //判断person 是否为值 如果有 设置UI
        if person != nil {
            nameFiled.text = self.person?.name
            phoneField.text = self.person?.phone
            titleFiled.text = self.person?.title
        }
    }
    
    @IBAction func SaveMessage(_ sender: Any) {
        
        //1 判断 person 是否存在 这个可以判断 是新增用户 还是 修改用户 
        if person == nil {
           person = Person()
        }
        
        //2 更新UI
        person?.name = nameFiled.text
        person?.phone = phoneField.text
        person?.title = titleFiled.text
       
        //3 执行闭包回调 -----特别注意
        // ! 强行解包 
        // ? 可选解包  -- 如果闭包为nil 就什么也不做。 闭包一定要使用 ‘？’
        CallBack?()
        
        //4 返回上一级  popViewController(animated: Bool) -> UIViewController?
        //这个pop方法 有一个返回值， 可以使用 ‘_’ 忽略一切内容
        _ = navigationController?.popViewController(animated: true)
        
        
    }

    
}
