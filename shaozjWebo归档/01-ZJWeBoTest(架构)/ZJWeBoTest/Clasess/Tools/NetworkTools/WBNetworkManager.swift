

import UIKit

import AFNetworking

//网络管理工具
class WBNetworkManager: AFHTTPSessionManager {
    
// MARK:-单例的创建
    //静态区 常量  闭包 在第一次执行的时候，执行闭包，并且将结果保存在share 常量中。
    static let share = WBNetworkManager()
    
    

}
