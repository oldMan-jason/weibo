//


import UIKit

//正常的注册id
private let normalcellID = "normalcellID"
//转发微博的id
private let retweetedID = "retweetedID"

class HomeViewController: WBBaseViewController {

    //实例化 ViewModel的声明
    lazy var listViewModel = WBStatusListViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //重写父类的获取数据院方法
    override func loadData() {

        //使用网络工具加载微博
        listViewModel.loadStatus(Pullup: self.isPullup){ (isSucess,hasMoreRefresh) in
            //结束刷新控件
            self.refreshControl.endRefreshing()
            //恢复上拉刷新标记
            self.isPullup = false
            //刷新表格
            if hasMoreRefresh {
                self.tableView?.reloadData()
            }
        }
     }
     
    // MARK:- 重写 父类的setupTableView 
    override func setupTableView() {
        super.setupTableView()
        //      let leftItem = UIBarButtonItem(title: "好友", style: .plain, target: self, action: #selector(addMyFriends))
        //        navigationItem.leftBarButtonItem = leftItem
        // MARK:- 通过扩展封装UIBarButtonItem 使用自己定义的Navgationitem
        navItem.leftBarButtonItem = UIBarButtonItem(title: "好友", target: self, action: #selector(addMyFriends))
        
        //UITableViewCell注册
//        tableView?.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
        
        // xib 注册cell
        tableView?.register(UINib(nibName: "HomeNormalStatusCell", bundle: nil), forCellReuseIdentifier: normalcellID)
        tableView?.register(UINib(nibName: "HomeRetweetedStatusCell", bundle: nil), forCellReuseIdentifier: retweetedID)
        
        //去掉cell的分隔线
        tableView?.separatorStyle = .none
        
        //设置tablevie自动布局高度  如果通过计算cell的高度，需要将这个自动行高的方法关闭
//        tableView?.rowHeight = UITableViewAutomaticDimension
        //预估行高
        tableView?.estimatedRowHeight = 300
        
        setupNavTitle()
    }
    
    //设置导航条的标题
    func setupNavTitle() -> Void{
        // 重载 button 
       let button = NavTitle(title: WBNetworkManager.share.userConfig.screen_name)
       navItem.titleView = button
       button.addTarget(self, action: #selector(clickTitleButton(btn:)), for: .touchUpInside)
    }
    
    @objc func clickTitleButton(btn: UIButton){
        
        btn.isSelected = !btn.isSelected
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
        return self.listViewModel.statusListArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath:
        IndexPath) -> UITableViewCell {
        
        let vm  = self.listViewModel.statusListArray[indexPath.row]
        
        //根据 retweeted_status 来判断 cellid 的标识
        let cellID = (vm.status.retweeted_status != nil) ? retweetedID : normalcellID

        let cell = tableView.dequeueReusableCell(withIdentifier: cellID) as! HomeStatusCell
        //模型视图赋值
        cell.viewModel = vm
        //设置cell代理
        cell.delegate = self
        
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
         let vm  = self.listViewModel.statusListArray[indexPath.row]
        
        return vm.rowHeigth
    }
}

extension HomeViewController: CellProtoucalDelegate{
    
    func didSelectedUrlString(cell: HomeStatusCell, string: String?) {
        
//        print(string)
        let  vc = WBWebViewController()
        vc.urlString = string
        present(vc, animated: true, completion: nil)
        
        
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
