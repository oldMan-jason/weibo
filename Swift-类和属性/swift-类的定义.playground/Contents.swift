//: Playground - noun: a place where people can play

import UIKit

//1 定义一个类 没有父类
class person{
    var age :Int?
}

let p = person()
p.age = 19

//2 定义一个继承 NSObject类 使用KVC方法
class personNew :NSObject{
    var age = 0
    var name :String? = nil
    //override 重写，如果我们写的某一个方法 是对父类的方法进行的重写，必须在该方法前面加上override
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
    
    }
    //kvc赋值
    override func setValuesForKeys(_ keyedValues: [String : Any]) {
        
        setValuesForKeys(keyedValues)
        
    }
}

let np = personNew()
np.setValuesForKeys(["name":"jason","school":"wuzhi","age":20])
if let name = np.name {
    print(name)
}
print(np.age)
		
