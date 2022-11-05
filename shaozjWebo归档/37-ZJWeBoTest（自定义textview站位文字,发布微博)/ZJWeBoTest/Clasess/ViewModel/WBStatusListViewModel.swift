//
//  WBStatusListViewModel.swift
//  ZJWeBoTest
//
//  Created by 邵泽俊 on 2017/2/7.
//  Copyright © 2017年 邵泽俊. All rights reserved.
//

import Foundation
import SDWebImage

/// 微博的视图模型 ViewModel
/*
    父类的选择
 - 如果类需要使用‘KVC’或者字典转模型框架设置对象值，类就需要继承制NSObject
 - 如果类只是包装一些代理逻辑，可以不用继承制NSObject，比较轻量级
 */

// 上拉最大的刷新次数
private let maxRereshTryCount = 3

class WBStatusListViewModel {
    
    //上拉刷新错误次数
    var refreshErrorCount = 0
    
    //定义一个WBStatuses 模型的数组
//    lazy var statusListArray = [WBStatuses]()
    // 采用 WBStatusViewModel 来关联 wbstatus 模型
    lazy var statusListArray = [WBStatusViewModel]()
    
    // MARK:- 加载微博列表
    /// - Parameters:
    ///   - Pullup: 是否上啦刷新
    ///   - completion: 完成的回调
    func loadStatus(Pullup: Bool,completion:@escaping (_ iSSucess: Bool,_ hasMoreRefresh:Bool)->()) -> Void {
    
        //判断是否是上拉刷新，同时检查刷新错误的次数
        if Pullup && refreshErrorCount >= maxRereshTryCount {
            print("上拉次数超过预定次数")
            //直接返回 不在进行网络请求
            completion(true, false)
            return
        }
        
        //设置下拉刷新 根据 since_id 来判断 取出数组的第一个id
        let since_id = Pullup ? 0 : (statusListArray.first?.status.id ?? 0)
        //设置上拉刷新 取出数组的最后一个 id
        let max_id   = !Pullup ? 0 : (statusListArray.last?.status.id ?? 0)
        
        //加载网络微博数据  【字典数组】
        WBNetworkManager.share.statusList(since_id: since_id ,max_id: max_id) { (list, isSucess) in
         
            //0 判断网络是否成功
            if (!isSucess){
                completion(false, false)
                return 
            }
 //****************************************************************//
            print(list)
            
            //1 字典转model 使用yymodel (所有第三方都支持model的嵌套)
            // 1》 定义一个可变的数组
            var array = [WBStatusViewModel]()
            // 2》 遍历服务器返回来的字典数据
            for dict in list ?? []{
                //配图
//                print(dict["pic_urls"] ?? "")
                //字典转model
                guard let model = WBStatuses.yy_model(with: dict) else{
                    continue
                }
                // MARK:- 第二层视图模型的 转化
                array.append(WBStatusViewModel(model: model))
                
            }
            print("刷新到\(array.count)条数据 \(array)")
//*****************************************************************//
            
            //2 拼接数据
            if Pullup {
                //上拉刷新 将结果拼接在数组的末尾
                self.statusListArray += array
                
            }else{
                //下拉刷新 将结果拼接在数组的前面
                self.statusListArray =  array + self.statusListArray
            }
            //3 判断上拉刷新的数据量
            if (Pullup && array.count == 0){
                
                print("没有数据啦")
                self.refreshErrorCount += 1
                print("---\(self.refreshErrorCount)--")
                completion(isSucess, false)
            }else{
                
                //缓存
                self.cacheSinleImage(list: array,cacheFinished: completion)
                
                //完成回调 ，此处应该是在sdweb 对图像缓存完成后 在进行的回调
//                completion(isSucess,true)
                
            }
            
        }
        
    }
    // MARK:- 缓存微博中单张图片
    func cacheSinleImage(list:[WBStatusViewModel],cacheFinished:@escaping (_ iSSucess: Bool,_ hasMoreRefresh:Bool)->()) -> Void {
     
        //调度组
        let group = DispatchGroup()
    
        //记录图片的数据长度
        var  length = 0
        
        //遍历数组，查找微博数据中有单张图片的，进行操作
        for vm in list {
            //1> 判断图像数量 如果不是单张，重新遍历数组
            if vm.picUrls?.count != 1 {
                continue
            }
            
            //2> 代码走到这里，数组中有且只有一张图片
            guard let pic = vm.picUrls?[0].thumbnail_pic,let url = URL(string:pic) else{
                continue
            }
            
//            print("要缓存的图片\(url)")
            //3>下载图片
            /*
                1. downloadImage 是SDWebImage的核心方法
                2. 图像下载完成之后，会自动保存在沙盒中，文件路径是URL的MD5
                3. 如果沙盒中已经存在缓存的图像，后续使用sd 通过 URL加载图像，都会从沙盒中加载。
                4. 不会发起网络请求，同时，回调方法 还是会调用。
             */
            
            //4> 调度组 要入组
            group.enter()
            
            SDWebImageManager.shared().downloadImage(with: url, options: [], progress: nil, completed: { (image, error, _, _, _) in
               
                //图像转化成 二进制
                guard let image = image, let data = UIImagePNGRepresentation(image) else{
                    return
                }
                
                //NSData的长度 在swift中是count
                length += data.count
                
                //图片缓存成功，跟新图片大小
                vm.updatePictureSize(image: image)
                //出组
                group.leave()
            })
        }
        
        //有时候 图片缓存无法回调
        cacheFinished(true, true)
        
        //5> 监听调度组情况
        group.notify(queue: DispatchQueue.main) { 
            print("单张的图片缓存--\(length / 1024) k ")
            
            // MARK:- 图片缓存完成的回调
            cacheFinished(true, true)
            
        }
    }
}
