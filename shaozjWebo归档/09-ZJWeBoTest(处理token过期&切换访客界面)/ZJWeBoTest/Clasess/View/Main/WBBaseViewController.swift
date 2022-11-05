

import UIKit


/*
    oc中，是不支持多继承的，只能通过协议的方式来代替
    Swift中，利用extension 可以吧‘函数’按照功能 分类管理，便于阅读和维护
    注意：！！！！
    1. extension 中不能有属性
    2. extension 中不能重写父类 本类 的方法，重写父类的方法，是子类的职责,在自己的类中重写，而扩展是对类的扩展。
 */

// 所有控制器的基类控制器
class WBBaseViewController: UIViewController {
    //添加tableview
    var tableView: UITableView?
    
    //添加刷新控件
    var refreshControl :UIRefreshControl?
    
    //判断 用户时候上拉刷新
    var isPullup = false
    
    //用户是否登入标记  可以采用 计算型属性代替 WBNetworkManager.share.login
//    var islogin = true
    
    //设置访客视图的字典
    var visitorInfo : [String: String]?
    
    // MARK:-懒加载 自定义navigationBar
    lazy var navigationBar: UINavigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 64))
    
    // MARK:- 自定义导航条title
    lazy var navItem = UINavigationItem()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpUI()
        //登录修改处！！！！
        //根据用户登录 来判断 没有登录 则不加载数据
        WBNetworkManager.share.login ?  loadData() : ()
        
        //注册 授权成功之后的通知回调
        NotificationCenter.default.addObserver(self, selector: #selector(changView), name: NSNotification.Name(rawValue: WBLoginSucessNotification), object: nil)
        
    }
    // MARK:- deinit
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    //切换授权登录成功之后方法
    func changView() -> Void {
        
        //登录前清空左边的注册 和 右边的 登录
        navItem.leftBarButtonItem = nil
        navItem.rightBarButtonItem = nil
        
        //更新UI--> 将访客视图替换成 表格视图 view = nil 控制器会重新 走 loadView -> ViewDidLoad
        view = nil
        // 注销通知，防止viewdidload再次注册
        NotificationCenter.default.removeObserver(self)
        
    }
    
    // MARK:- 重写title
    override var title: String?{
        //重写 title 的 didSet方法
        didSet{
            navItem.title = title
        }
    }
    // MARK:- 获取数据源
    func loadData() -> Void {
        print("父类的获取数据")
        //如果子类不实现任何方法，就关闭刷新控件
        refreshControl?.endRefreshing()
    }
    

}


extension WBBaseViewController{
    // MARK:- 设置UI
    func setUpUI(){
        print("父类方法")
        view.backgroundColor = UIColor.cyan
        automaticallyAdjustsScrollViewInsets = false
// MARK:-设置导航条
        setupNavgationBar()
//根据用户是否登入 来判断 显示什么样的界面
//        islogin ? setupTableView() : setupVisitorView()
        WBNetworkManager.share.login ? setupTableView() : setupVisitorView()

        
    }
// MARK:-设置导航条
    func setupNavgationBar() -> Void {
        //添加导航条
        view.addSubview(navigationBar)
        //将item 设置给 bar
        navigationBar.items = [navItem]
        //设置nav的不透明
        navigationBar.isTranslucent = false
        //设置导航条上的文字颜色
        navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.darkGray]
        //设置系统按钮的文字渲染颜色
        navigationBar.tintColor = UIColor.orange
    }
    
// MARK:- 添加tableView
    func setupTableView() -> Void {
        
        tableView = UITableView(frame: view.bounds, style: .plain)
        view.insertSubview(tableView!, belowSubview: navigationBar)
        
        //设置数据源代理，让子类直接实现数据源方法
        tableView?.dataSource = self
        tableView?.delegate = self
        //设置 tableview的缩进
        tableView?.contentInset = UIEdgeInsetsMake(navigationBar.bounds.height, 0, tabBarController?.tabBar.bounds.height ?? 49, 0)
        //实例化刷新控件
        refreshControl = UIRefreshControl()
        //添加到表格视图中
        tableView?.addSubview(refreshControl!)
        //添加监听方法
        refreshControl?.addTarget(self, action: #selector(loadData), for: .valueChanged)
        
    }
    
// MARK:-添加访客视图
    func setupVisitorView() -> Void {
        
        let visitorView = VisitorView(frame: view.bounds)
        //传递访客视图的信息
        visitorView.visitorDict = visitorInfo
        
        view.insertSubview(visitorView, belowSubview: navigationBar)
        
        //设置登录和注册的点击事件
        visitorView.loginButton.addTarget(self, action: #selector(login), for: .touchUpInside)
        visitorView.registerButton.addTarget(self, action: #selector(register), for: .touchUpInside)
        
        //设置navgationBar的Item
        navItem.leftBarButtonItem = UIBarButtonItem(title: "注册", style: .plain, target: self, action: #selector(register))
        navItem.rightBarButtonItem = UIBarButtonItem(title: "登入", style: .plain, target: self, action: #selector(login))
        
    }
}

// MARK:- 登录注册功能
extension WBBaseViewController{
    
    func login(){
//        print("登录")
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: WBLoginNotification), object: nil)
    }
    
    func register(){
        print("注册")
    }
}

// MARK:- UITableview的代理方法
extension WBBaseViewController: UITableViewDataSource,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
     /*
        基类只是准备方法，子类负责实现
        子类的数据源方法 不需要 super
     */
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        return UITableViewCell()
    }
    
    // 将要显示cell 在显示最后一行的时候，做上拉刷新
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        //判断 IndexPath 是否是最后一行 (indexPath.section 最大) （indexPath.row最大）
        //1> row
        let row  = indexPath.row
//        print("row - \(row)")
        
        //2> section
        let section  = tableView.numberOfSections - 1
//        print("section - \(section)")
        
        if row < 0 || section < 0 {
            return
        }
        //3> 行数
        let  count = tableView.numberOfRows(inSection: section)
//        print("count - \(count)")
        //如果是最后一行，同时没有做上啦刷新的动作
        if row == (count - 1) && !isPullup
        {
            isPullup = true
            //开始刷新,获取数据
            loadData()
        }
    }
}
