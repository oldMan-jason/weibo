//: Playground - noun: a place where people can play

import UIKit


// 1 定义字典
// 1.1> 不可变字典  let修饰  系统会自动判断后面的 [] 中存放的是键值对，还是一个一个的元素
let letDict1 = ["name" : "shaozj","age" : "20", "height" : "199"]
let letDict2 : [String : Any] = ["name":"shaozj","age":12,"height":1.8];

// 1.2> 定义可变字典   var修饰
// AnyObject ：一般指定类型     NSObject：一般用于创建对象
var DictM = [String : Any]()

// 2 对可变字典的基本操作
// 2.1 添加元素
DictM["kk"] = "nike"
DictM["name"] = "361"
DictM["age"] = 12

// 2.2 删除
DictM.removeValue(forKey: "kk")
print(DictM)
// 2.3 修改
DictM["age"] = 29
print(DictM)
// 2.4 获取
DictM["name"]

// 3 遍历字典
// 3.1 遍历字典中所有的key
for key in DictM.keys{
    print(key)
}
// 3.2 遍历字典中国所有的value 
for value in DictM.values{
    print(value)
}
// 3.3 遍历所有的键值对
for (key,value)in DictM{
    print(key)
    print(value)
}
// 4 合并字典
// 即使类型一致也不能相加进行合并
let dic1 :[String : Any] = ["school": "qianfeng","score":98,"id":3231,"sex":"boy"]
var dic2 :[String :Any] = ["color":"blue","music":"你好?","numberi":234]
// 错误写法
//let  reslutDic  = dic1 + dic2
// 正确的写法
for (key,value) in dic1{
    dic2[key] = value
}
print(dic2)
















