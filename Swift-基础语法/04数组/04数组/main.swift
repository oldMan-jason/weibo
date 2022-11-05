//
//  main.swift
//  04数组
//
//  Created by 邵泽俊 on 16/7/30.
//  Copyright © 2016年 邵泽俊. All rights reserved.
//

import Foundation
/**
 数组的概念和定义
 */
var array1 = [2, 3 ,4 ,5]
var array2 : Array = [2,3,4,5]
var array3 : Array<Int> = [2,3,4,5]
var array4 : [Int] = [2,3,4,5]
var array5 : [Double] = [1.2, 3.4]
var array6 : [String] = ["shao","zjun"]

print(array2.count)
/**
 数组中是可以放置不同类型的数据  Any --> 泛型
 */
var array7 : Array<Any> = ["a",12,"shazejun",1.2]
/**
 数组的元素访问数组中的元素   在数组中插入或者增加元素
 */

var array8 = ["qiafneg","zejun","shao"]
print(array8[0])
/**
 newElement 参数名称
 */
//在数组的尾部插入一个元素
array8.append("sky")
//array8.insert("love", atIndex: 3)
array8.insert("love", at: 3)
print(array8)

/**
 数组元素的修改和删除操作
 */
var array9 : Array = ["shaozejun","qianfeng",1.2,34] as [Any]

array9[2] = "swift"

array9.removeLast()
//删除指定索引的元素
array9.remove(at: 2)
//删除数组中的所有元素 并保持容量
array9.removeAll(keepingCapacity: true)
//打印 数组的容量
print(array9.capacity);


/**
 Range
 */
//var range :Range<Int> = Range(statrt )

/**
 数组的批量操作
 */
var array10 = [1,2,3,4,5,67,10]
array10 [0...4] = [9,89,12]
//array10.replaceRange(Range(start :0,end : 2), with: [2,2,3,4,5])
print(array10)

//array10 += 12
array10.append(10)
array10 += [10,12,33]
//array10 += Slice;
array10 += array10[0...1]

/**
 数组遍历
 */
for elem in array10 {
    print(elem)
}
//for (index ,value) in enumerate(array10){
//    
//}

