//
//  WBStatusListViewModel.swift
//  ZJWeBoTest
//
//  Created by 邵泽俊 on 2017/2/7.
//  Copyright © 2017年 邵泽俊. All rights reserved.
//

import Foundation


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
    lazy var statusListArray = [WBStatuses]()
    
    /// 加载微博列表
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
        let since_id = Pullup ? 0 : (statusListArray.first?.id ?? 0)
        //设置上拉刷新 取出数组的最后一个 id
        let max_id   = !Pullup ? 0 : (statusListArray.last?.id ?? 0)
        
        WBNetworkManager.share.statusList(since_id: since_id ,max_id: max_id) { (list, isSucess) in
         
            //1 字典转model 使用yymodel
            guard let YY_Array = NSArray.yy_modelArray(with: WBStatuses.self, json: list ?? []) as? [WBStatuses] else{
                
                completion(isSucess, false)
                return
            }
            
            print("刷新到\(YY_Array.count)条数据")
            //2 拼接数据
            if Pullup {
                //上拉刷新 将结果拼接在数组的末尾
                self.statusListArray += YY_Array
                
            }else{
                //下拉刷新 将结果拼接在数组的前面
                self.statusListArray =  YY_Array + self.statusListArray                
            }
            //3 判断上拉刷新的数据量
            if (Pullup && YY_Array.count == 0){
                
                print("没有数据啦")
                self.refreshErrorCount += 1
                print("---\(self.refreshErrorCount)--")
                completion(isSucess, false)
            }else{
                //完成回调
                completion(isSucess,true)
                
            }
            
        }
        
    }
    
    
}
