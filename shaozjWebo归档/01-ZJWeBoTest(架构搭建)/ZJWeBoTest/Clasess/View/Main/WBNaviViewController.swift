
import UIKit

class WBNaviViewController: UINavigationController {

    override func viewDidLoad() {
        //隐藏默认的 navigationbar
        navigationBar.isHidden = true
        
    }
    
    //重写 push方法，所有的push 都会调用此方法
    //viewController 是要push的控制器，设置它左侧的按钮，作为返回按钮
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        
    //1 首先需要判断 是否是 根控制器，如果不是栈底控制器才需要隐藏，是的话不需要处理
        if childViewControllers.count > 0 {
            //隐藏tabBar
            viewController.hidesBottomBarWhenPushed = true
            var titleBack = "返回"
            //判断控制的类型
            if let vc = viewController as? WBBaseViewController {
                //判断控制的级数，只有一个子控制器的时候，返回按钮才是 上一个控制器的title
                if childViewControllers.count == 1 {
                    titleBack = childViewControllers.first?.title ?? "返回"
                }
                //设置左侧按钮 作为返回按钮的文字
                vc.navItem.leftBarButtonItem = UIBarButtonItem(title: titleBack, target: self, action: #selector(PopTpParent),isBack:true)
                
            }
        }
        
        //一定需要调用父类
        super.pushViewController(viewController, animated: true)
      
    }
    
    // MARK:- 返回
    func PopTpParent() -> Void {
        popViewController(animated: true)
    }

}
