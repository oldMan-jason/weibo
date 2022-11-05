//: Playground - noun: a place where people can play

import UIKit

class Student : NSObject{
    //定义存储属性
    var age :Int = 0
    var name:String? = nil
    var mathScore :Double = 0.0
    var chineseScore :Double = 0.0

    //定义一个计算属性 （建议使用）
    var getaverage :Double{
        return (mathScore + chineseScore) * 0.5
    }
    
    //定义类属性：类属性是和整个类相关的属性，而且是通过类名进行访问
    static var courseCount :Int = 0
    
    
    //定义一个方法 可以返回平均值 （不建议）
    func GetAverageScore() -> Double {
        // 在swift开发中，如果使用当前对象的某一个属性，或者调用当前对象的某一个方法时
        // 可以直接使用，不需要在前面加self
        return (mathScore + chineseScore) * 0.5
    }
}

//给类型属性进行赋值
Student.courseCount = 10

//创建对象
let stu = Student()
//给对象的属性赋值
stu.age = 18
stu.name = "jason"
stu.mathScore = 98.2
stu.chineseScore = 60

stu.GetAverageScore()

print(stu.age)
if let name = stu.name {
    print(name)
}


		
