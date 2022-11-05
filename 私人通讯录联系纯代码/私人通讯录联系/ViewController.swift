//
//  ViewController.swift
//  私人通讯录联系
//
//  Created by 邵泽俊 on 2017/1/14.
//  Copyright © 2017年 邵泽俊. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //数据源数组
    lazy var dataArray = [Person]()
    
    lazy var addItem : UIBarButtonItem = {
        
        let  add = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addAction))
        return add
        
    }()
    
    
    //属性申明
    lazy var tableView : UITableView = {
        
        let tabVC  = UITableView(frame: UIScreen.main.bounds, style: .plain)
        tabVC.dataSource = self
        tabVC.delegate = self
        return tabVC
        
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "通讯录"
        
        self.navigationItem.rightBarButtonItem = self.addItem
    
        view.addSubview(self.tableView)
        
        self.loadData { (data) in
            self.dataArray += data
            self.tableView.reloadData()
        }
    }
}

// MARK:- 获取数据
extension ViewController{
    
    func loadData(retureData:@escaping (_ reslut: [Person])->()) -> Void {
        
        DispatchQueue.global().async {
            
            var tempArray = [Person]()
            for _ in 0...10{
                
                let p = Person()
                p.name = "jason"
                p.number = "15803316398"
                tempArray.append(p)
            }
            DispatchQueue.main.async(execute: { 
                
             retureData(tempArray)
                
            })
        }
    }
}

// MARK:- tableView的代理方法
extension ViewController:UITableViewDataSource,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    return self.dataArray.count;
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     
        let cellid = "cellid"
        var cell  = tableView.dequeueReusableCell(withIdentifier: cellid)
        
        if cell == nil {
            cell = UITableViewCell.init(style: .subtitle, reuseIdentifier: cellid)
        }
        cell?.textLabel?.text = self.dataArray[indexPath.row].name
        cell?.detailTextLabel?.text = self.dataArray[indexPath.row].number
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        let p  = self.dataArray[indexPath.row]
        let detalVC  = DetailViewController()
        detalVC.p = p
        
        detalVC.dataReturn = {
            
            self.tableView.reloadRows(at: [indexPath], with: .left)
        }
        self.navigationController?.pushViewController(detalVC, animated: true)
        
    }
}

// MARK:- 自定义方法
extension ViewController{
    
    func addAction() -> Void {
        
        print("xxx")
        let detalVC  = DetailViewController()
        
        detalVC.dataReturn =  {
            guard let person = detalVC.p else {
                return
            }
                self.dataArray.insert(person, at: 0)
                self.tableView.reloadData()
            
        }
        
        self.navigationController?.pushViewController(detalVC, animated: true)
        
    }
}
