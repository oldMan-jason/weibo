

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
//    static let share = WBNetworkManager()
    
    //上面的写法以为请求数据的时候 反序列格式不支持 ，需要进行修改；如下：：
    static let share: WBNetworkManager = {
        //实例化对象
        let instances = WBNetworkManager()
        // 设置响应的反序列化支持的数据类型
        instances.responseSerializer.acceptableContentTypes?.insert("text/plain")
        // 返回对象
        return instances
    }()
    /*
     该属性 可以用 model封装
     
    //访问令牌，所有网络请求，都基于此令牌
    var accessToken : String? //= "2.00R87bPGR_xVnDbf1df3650b8ND4GC"
    //设置 微博用户的未读数量  5365823342
    var uid : String? = "1073880650"
    */
    
    //懒加载用户信息model
    lazy var userConfig = WBUserConfig()
    
    //利用计算性属性 判断是否登入
    var login: Bool{
        
        return userConfig.access_token != nil
    }
    
    // MARK:- 专门负责拼接 token的网络请求方法
    //为了能通用与文件上传的方法，添加 name 和 data 字段
    func requestToken(requestMothed:HTTPMothed = .GET,urlString: String,parmers: [String:Any]?,name: String? = nil,data: NSData? = nil,completion:@escaping (_ jsonData:Any?, _ isSucess: Bool)->()) -> Void {
     
        //处理 token
        //0 > 判断token 是否为nil，如果为nil，则直接返回。
        guard let token = userConfig.access_token else {
            print("没有获取到token值")
            // 发送通知 通知用户登录
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: WBLoginNotification), object: nil)
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
        
        //3 判断name 和data 如果都不为nil 表示是一个带有图片的文件上传
        if let name = name,let data = data {
            
            uploadFile(urlString: urlString, parmers: parmers, name: name, data: data, completion: completion)
        }else{
            
            request(urlString: urlString, parmers: parmers, completion: completion)
        }
        
    }
    
    
    
    // MARK:- 封装AFN的上传文件
    /// - Parameters:
    ///   - urlString: url
    ///   - parmers: 参数
    ///   - name: 接受上传数据的服务器字段（name - 要咨询公司后台）pic
    ///   - data: 上传的二进制文件
    ///   - completion: 完成回调
    func uploadFile(urlString: String,parmers: [String:Any]?,name: String,data:NSData,  completion:@escaping (_ jsonData:Any?, _ isSucess: Bool)->()) -> Void {
     
        post(urlString, parameters: parmers, constructingBodyWith: { (formData) in
            // MARK:-创建 formData
            /*
                1 data： 需要上传的二进制文件
                2 name： 服务器接受字段的字段名
                3 fileName： 保存在服务器的文件名字，可以随便写
                4 mimeType： 告诉服务器文件上传额文件类型，如果不想上传可以使用 application/octet-stream
             */
            formData.appendPart(withFileData: data as Data, name: name, fileName: "shaozj", mimeType: "application/octet-stream")
            
        }, progress: nil, success: { (_, json) in
            
            completion(json, true)
        
        }) { (dataTask, error) in
            
            //针对 403 处理用户 token 过期问题
            if ((dataTask?.response as? HTTPURLResponse)?.statusCode == 403) {
                
                print("token过期")
                
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: WBShouldLoginNotification), object: "badToken")
            }
            
            completion(nil, false)
        }
    }
    
    // MARK:- 封装AFN 的GET/POST
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
                
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: WBShouldLoginNotification), object: "badToken")
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
