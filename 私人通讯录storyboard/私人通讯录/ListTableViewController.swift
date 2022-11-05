//
//  ListTableViewController.swift
//  私人通讯录
//
//  Created by 邵泽俊 on 2017/1/14.
//  Copyright © 2017年 邵泽俊. All rights reserved.
//

import UIKit

class ListTableViewController: UITableViewController {

    var personArray = [Person]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.loadData { (list) in
            
            //拼接数组
            self.personArray += list
            //刷新表格
            self.tableView.reloadData()
            
            print(list)
        }
        
        
    }
    // MARK:- 新增联系人
    @IBAction func AddContact(_ sender: Any) {
    
        performSegue(withIdentifier: "listdetail", sender: nil)
        
    }
    
    // MARK:- 异步加载数据
    private func loadData(completion:@escaping (_ reslut :[Person]) -> ()) -> Void {
        DispatchQueue.global().async {
            Thread.setThreadPriority(1.0)
            var array = [Person]()
            
            for _ in 0...10{
                let p = Person()
                p.name = "jason"
                p.phone = "13333"
                p.title = "kk"
                array.append(p)
            }
            DispatchQueue.main.async(execute: {
                completion(array)
            })
        }
    }
    // MARK:- UITableViewDataSources
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return  self.personArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellid", for: indexPath)
        
        cell.textLabel?.text = self.personArray[indexPath.row].name
        cell.detailTextLabel?.text = self.personArray[indexPath.row].phone

        return cell
    }
    
    // MARK:- 点击表格跳转
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        //执行segue跳转
        performSegue(withIdentifier: "listdetail", sender: indexPath)
       
    }
    
    // MARK:- 控制器的跳转
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //获取目的控制器 转化成 DetailTableViewController
        // as! 或者 as?  主要是根据前面的返回值决定  var destination: UIViewController
        // if let / guard let 判断语句 一定要使用  as？
        
        let vc = segue.destination as! DetailTableViewController
        
        //设置选中person
        //sender: Any?
        if let indextPath = sender as? IndexPath {
            
            vc.person = self.personArray[indextPath.row]
            
        //设置闭包回调函数
            vc.CallBack = {
                self.tableView.reloadRows(at: [indextPath], with: .left)
            }
        }else{//这个是 点击“新增” 联系人的跳转
            
            //新建个人闭包的回调函数  注意容易产生循环引用
            vc.CallBack = { [weak vc] in
                //获取明细控制器的person
                guard let person = vc?.person else {
                    return
                }
                //插入数据源数组中，刷新表格
                self.personArray.insert(person, at: 0)
                
                self.tableView.reloadData()
        
            }
        }
    }
}

