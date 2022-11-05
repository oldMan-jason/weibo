
import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addChildController(childVcString: "HomeTableViewController", title: "首页", imgaName: "tabbar_home")
        addChildController(childVcString: "MessageTableViewController", title: "消息", imgaName: "tabbar_message_center")
        addChildController(childVcString: "DiscoverTableViewController", title: "发现", imgaName: "tabbar_discover")
        addChildController(childVcString: "ProfileTableViewController", title: "我", imgaName: "tabbar_profile")
        
    }
    
    //自定义方法 swift支持方法的重载
    //private 在当前 文件 可以访问该方法 但在其他的文件是不可以访问
    private func addChildController(childVcString: String,title:String,imgaName:String) {
        //<ZJWeiBo.HomeTableViewController: 0x7f8908409330>
        //print(HomeTableViewController())
        
        //0 获取命名空间 namespace Any？可选类型 需要转化成 NSString？的可选类型
        let nameSpace = Bundle.main.infoDictionary!["CFBundleExecutable"] as? String
        
        guard nameSpace != nil else{
            print("没有获取到命名空间")
            return
        }
        
        //1 根据字符串获取对应的class childVcClass是一个AnyClass? 可选类型
        let childVcClass = NSClassFromString(nameSpace! + "." + childVcString)
        guard  childVcClass != nil else {
            print("没有获取到字符串对应的class");
            return
        }
        print("获取到字符串对应的class")

        //2 将对应的AnyClass？ 转化成 控制器的类型
        let chilVcType = childVcClass as? UIViewController.Type
        guard chilVcType != nil else {
            return
        }
        
        //3 创建对应的控制器对象  这个是Swift的特定写法  根据类型创建控制器
        let childVc = chilVcType?.init()
        
        //4 设置子控制器的属性
        childVc?.title = title
        childVc?.tabBarItem.image = UIImage(named: imgaName)
        childVc?.tabBarItem.selectedImage = UIImage(named: imgaName + "_highlighted")
        //5 包装一个导航控制器
        let childNav = UINavigationController(rootViewController: childVc!)
        //6 添加控制器
        addChildViewController(childNav)
        
    }
}
