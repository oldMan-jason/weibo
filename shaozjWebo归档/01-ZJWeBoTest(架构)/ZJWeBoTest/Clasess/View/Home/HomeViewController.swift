//
//  HomeViewController.swift
//  ZJWeBoTest
//
//  Created by 邵泽俊 on 2017/1/16.
//  Copyright © 2017年 邵泽俊. All rights reserved.
//

import UIKit

private let cellID = "cellID"

class HomeViewController: WBBaseViewController {

    lazy var dataArray = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlstr = "https://api.weibo.com/2/statuses/home_timeline.json"
        let parmars = ["access_token":"2.00R87bPGR_xVnDbf1df3650b8ND4GC"]
        WBNetworkManager.share.get(urlstr, parameters: parmars, progress: nil, success: { (dataTask, json) in
            print(json ?? "")
        }) { (_, error) in
            
        }
    }
    
    //重写父类的获取数据院方法
    override func loadData() {
        
            for  i in 0...30 {
                if isPullup {
                    self.dataArray.append("上拉-\(i)")
                }else{
                    self.dataArray.insert(i.description, at: 0)
                }
            }
        //结束刷新控件
        self.refreshControl?.endRefreshing()
        //恢复上拉刷新标记
        self.isPullup = false
        //刷新表格
        self.tableView?.reloadData()
    }
    
    // MARK:- 重写 父类的setupTableView 
    override func setupTableView() {
        super.setupTableView()
        //      let leftItem = UIBarButtonItem(title: "好友", style: .plain, target: self, action: #selector(addMyFriends))
        //        navigationItem.leftBarButtonItem = leftItem
        // MARK:- 通过扩展封装UIBarButtonItem 使用自己定义的Navgationitem
        navItem.leftBarButtonItem = UIBarButtonItem(title: "好友", target: self, action: #selector(addMyFriends))
        
        //UITableViewCell注册
        tableView?.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
    }
    
    /*
        因为只关心 用户登录后的界面 所以没有必要重写 setUpUI方法， 直接重写setupTableView
     */
    //重写父类的方法
//    override func setUpUI() {
        //调用父类的方法
//        super.setUpUI()
//    }
}


// MARK: - 实现数据源代理方法
extension HomeViewController{
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        cell?.textLabel?.text = self.dataArray[indexPath.row]
        return cell!
        
    }
}

// MARK:- 自定义方法
extension HomeViewController{
    
    func addMyFriends() -> Void {
        
        let addVC = AddContactViewController()
        addVC.title = "\((navigationController?.childViewControllers.count) ?? 0)"
        navigationController?.pushViewController(addVC, animated: true)
        
    }
    
}
