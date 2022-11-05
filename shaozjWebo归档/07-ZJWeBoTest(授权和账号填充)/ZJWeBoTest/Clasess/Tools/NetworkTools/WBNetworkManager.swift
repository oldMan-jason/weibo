

import UIKit
import AFNetworking


//设置枚举
enum HTTPMothed{
    case GET
    case POST
}


//网络管理工具
class WBNetworkManager: AFHTTPSessionManager {
    
// MARK:-单例的创建
    //静态区 常量  闭包 在第一次执行的时候，执行闭包，并且将结果保存在share 常量中。
    static let share = WBNetworkManager()
    //访问令牌，所有网络请求，都基于此令牌
    var accessToken : String? //= "2.00R87bPGR_xVnDbf1df3650b8ND4GC"
    
    //利用计算性属性 判断是否登入
    var login: Bool{
        
        return accessToken != nil
    }
    
    
    //设置 微博用户的未读数量  5365823342
    var uid : String? = "1073880650"
    
    // 专门负责拼接 token的网络请求方法
    func requestToken(requestMothed:HTTPMothed = .GET,urlString: String,parmers: [String:Any]?,completion:@escaping (_ jsonData:Any?, _ isSucess: Bool)->()) -> Void {
     
        //处理 token
        //0 > 判断token 是否为nil，如果为nil，则直接返回。
        guard let token = accessToken else {
            print("没有获取到token值")
            // FIXME: 发送通知 通知用户登录
            completion(nil, false)
            return
        }
        //1> 判断 参数字典是否存在，如果为nil，应该新建一个字典
        var parmers = parmers
        if parmers == nil {
            //实例化字典
            parmers = [String: Any]()
        }
        //2> 设置参数的字典
        parmers!["access_token"] = token
        
        //3> 发起真正额网络请求
        request(urlString: urlString, parmers: parmers, completion: completion)
        
    }
    // 使用一个函数 封装 GET、POST 请求,采用枚举值进行区分，函数体内定义闭包，将json数据返回回去
    func request(requestMothed:HTTPMothed = .GET,urlString: String,parmers: [String:Any]?,completion:@escaping (_ jsonData:Any?, _ isSucess: Bool)->()) -> Void {
        
        //定义成功的闭包变量
        let sucess  = { (dataTask:URLSessionDataTask,json:Any?) -> () in
            
            completion(json, true)
        }
        //定义失败的闭包
        let failure = {(dataTask:URLSessionDataTask?,error: Error) -> () in
            print("网络请求错误\(error)")
            //针对 403 处理用户 token 过期问题
            if ((dataTask?.response as? HTTPURLResponse)?.statusCode == 403) {
                
                print("token过期")
            // FIXME: 发送通知
            }
            
            completion(nil, false)
        }
        if requestMothed == .GET {
            
            get(urlString, parameters: parmers, progress: nil, success: sucess, failure: failure)
            
        }else{
         
            post(urlString, parameters: parmers, progress: nil, success: sucess, failure: failure)
            
        }
    }
    

}
