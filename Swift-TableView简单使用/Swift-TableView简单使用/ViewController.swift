//
//  ViewController.swift
//  Swift-TableView简单使用
//
//  Created by 邵泽俊 on 2016/11/28.
//  Copyright © 2016年 邵泽俊. All rights reserved.
//

import UIKit

class ViewController: UIViewController{

    
    // MARK:-懒加载属性
    //1 懒加载创建tableview
    lazy var tableView:UITableView = UITableView()
    
    // MARK:-ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
       
    }
    //设置UI相关的
    func setupUI(){
        //2 添加tableview
        self.view.addSubview(tableView)
        //3 设置frame
        tableView.frame = view.bounds
        //4 设置数据源
        tableView.dataSource = self
        tableView.delegate = self
    }
}

//extension 类似于 oc的category 也只只能扩充方法 不能增加属性
//让 extension 下的ViewController 准守协议
extension ViewController:UITableViewDelegate,UITableViewDataSource{
    
    // MARK:-UITableviewDataSources
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 12
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //1 创建cell
        let cellID : String = "CellID"
        
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        
        if cell==nil {
            cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: cellID)
        }
        cell?.textLabel?.text = "测试数据\(indexPath.row)"
        return cell!
        
    }
    
    
    // MARK:-UITableviewDeletegate
    //cell点击
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("点击\(indexPath.row)")
    }
}











