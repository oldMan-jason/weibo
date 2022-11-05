


import UIKit

enum DraggingType {
    case Normal //普通 什么都不做
    case Pulling // 超越零界点 如果放手开始刷新
    case WillRefresh // 将要刷新，超过零界点 并且放手
}

/// 刷新的临界值
private let RefreshCommone = 60

/// 处理刷新的业务逻辑
class ZJRefresh: UIControl {
    
    // MARK:- 属性
    private weak var scrollView : UIScrollView?
    
    /// 懒加载 刷新view
    lazy var refreshView : ZJRefreshView = ZJRefreshView.refreshView()
    
    override init(frame: CGRect) {
        super.init(frame: CGRect())
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }
    
    // MARK:- 在addSubview时调用
    override func willMove(toSuperview newSuperview: UIView?) {
        super.willMove(toSuperview: newSuperview)
        
        guard let scrollView = newSuperview as? UIScrollView else{
            return
        }
        //记录父视图
        self.scrollView = scrollView
        //KVO 监听父视图 contentOffset
        self.scrollView?.addObserver(self, forKeyPath: "contentOffset", options: [], context: nil)
    
    }
    
    // MARK:- KVO监听 偏移量
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
        guard let sv = scrollView else {
            return
        }

        //计算出 下拉的高度
        let height = -(sv.contentInset.top + sv.contentOffset.y)
        print(height)

        if height < 0 {
            return
        }
        //设置刷新控件的大小  注意刷新控件的Y坐标
        self.frame = CGRect(x: 0, y: -height, width: sv.bounds.width, height: height)
        //判断临界点 只需要判断一次，采用的方式是 使用枚举值进行判断
        if sv.isDragging {
            
            if height > CGFloat(RefreshCommone) && refreshView.refreshType == .Normal{
                
                refreshView.refreshType = .Pulling
                
                print("放手刷新")
            }else if height <= CGFloat(RefreshCommone) && refreshView.refreshType == .Pulling{
                
                refreshView.refreshType = .Normal
                
                print("继续下拉")
            }
        }else{
            //放手
            if refreshView.refreshType == .Pulling {
                print("准备开始刷新")
                beginRefreshing()

                //发送数据
                sendActions(for: .valueChanged)
            }
        }
    }
    
    //reason: 'An instance 0x7fc94402d800 of class UITableView was deallocated while key value observers were still registered with it
    //一定要实现 移除 KVO的监听 否则程序会崩溃
    override func removeFromSuperview() {
        
        //代码运行到此 superView 仍然存在
        superview?.removeObserver(self, forKeyPath: "contentOffset")
        
        super.removeFromSuperview()
        
        //代码运行到这里 superView不存在，所以不能在此处移除
    }
    
    func beginRefreshing() {
        //1 判断是否有父视图
        guard let sv = scrollView else {
            return
        }
        
        //2.判断是否正在刷新
        if refreshView.refreshType == .WillRefresh {
            return
        }
        //3.刷新结束后将状态修改为 Normal 才可以继续刷新
        refreshView.refreshType = .WillRefresh
        //4.设置偏移量
        var inset = sv.contentInset
        inset.top += CGFloat(RefreshCommone)
        sv.contentInset = inset
        
    }
    
    // MARK:- 结束刷新
    func endRefreshing() {
        
        guard let sv = scrollView else {
            return
        }
        
        // MARK:- 判断是否正在刷新
        if refreshView.refreshType != .WillRefresh {
            return
        }
        
        //恢复刷新表格的状态
        refreshView.refreshType = .Normal
        
        //恢复表格的 contentInset
        var inset  = sv.contentInset
        inset.top -= CGFloat(RefreshCommone)
        sv.contentInset = inset
     
    }
 

}

extension ZJRefresh{
    
    func setupUI() -> Void {
        
        addSubview(refreshView)
        
        //设置自动布局
        refreshView.translatesAutoresizingMaskIntoConstraints = false
        addConstraint(NSLayoutConstraint(item: refreshView,
                                         attribute: .centerX,
                                         relatedBy: .equal,
                                         toItem: self,
                                         attribute: .centerX,
                                         multiplier: 1.0,
                                         constant: 0))
        
        addConstraint(NSLayoutConstraint(item: refreshView,
                                         attribute: .bottom,
                                         relatedBy: .equal,
                                         toItem: self,
                                         attribute: .bottom,
                                         multiplier: 1.0,
                                         constant: 0))
        // MARK:- xib加载视图 需要制定控件的宽高
        addConstraint(NSLayoutConstraint(item: refreshView,
                                         attribute: .width,
                                         relatedBy: .equal,
                                         toItem: nil,
                                         attribute: .notAnAttribute,
                                         multiplier: 1.0,
                                         constant: refreshView.bounds.size.width))
        
        addConstraint(NSLayoutConstraint(item: refreshView,
                                         attribute: .height,
                                         relatedBy: .equal,
                                         toItem: nil,
                                         attribute: .notAnAttribute,
                                         multiplier: 1.0,
                                         constant: refreshView.bounds.size.height))
        
     
        
    }
    
}
