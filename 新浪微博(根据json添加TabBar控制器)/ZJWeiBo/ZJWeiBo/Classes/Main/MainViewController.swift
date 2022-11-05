
import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //1 获取json文件的路径
        let jsonpath = Bundle.main.path(forResource:"MainVCSettings", ofType:"json")
        guard  jsonpath != nil else{
            print("没有获取到jso文件的路径");
            return
        }
        print("获取到jso文件的路径");
        
        //2 读取json文件中的内容
        let jsonData = NSData(contentsOfFile: jsonpath!)
        guard jsonData != nil else {
            print("没有获取到json文件中的数据")
            return
        }
        print("获取到json文件中的数据")
        
        //3 将NSData转化成数组  特别注意的地方  jsonData as! Data
        let anyObj = try? JSONSerialization.jsonObject(with: jsonData as! Data, options: .mutableContainers)
        
        guard anyObj != nil else {
            return
        }
           //3.1 将anyObj 转化成 字典类型 外面数组 里面字典
        let dictArray =  anyObj as? [[String : AnyObject]]
        guard dictArray != nil else {
            return
        }
        //4 遍历数组 获取对应的信息
        for dict in dictArray! {
            
            print(dict)
            //4.1 获取控制器对应的字符串
            guard let vcName = dict["vcName"] as? String else{
                continue
            }
            //4.2 获取控制器显示title
            guard let title = dict["title"] as? String else{
                continue
            }
            //4.3 获取显示的图片
            guard let imageName = dict["imageName"] as? String else{
                continue
            }
            //4.4 添加子控制器
            addChildController(childVcString: vcName, title: title, imgaName: imageName)
        
        }
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
