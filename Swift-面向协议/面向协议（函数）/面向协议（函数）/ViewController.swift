//
//  ViewController.swift
//  面向协议（函数）
//
//  Created by 邵泽俊 on 2017/6/30.
//  Copyright © 2017年 邵泽俊. All rights reserved.
//

import UIKit

struct Range<Bound: Comparable> {
    public let lower: Bound
    public let up: Bound
}


class ViewController: UIViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        someFunction(p: plus(a:b:), a: 3, b: 4)
        
        _ = Range.init(lower: 2, up: 2)
        
        
        let studdet = ClassOne()
        
        
            studdet.stname = "Swift"
            studdet.marks = 98
            studdet.markssecured()
        
            print(studdet.marks)
            print(studdet.result)
            print(studdet.present)
            print(studdet.subject)
            print(studdet.stname)
        
        
    }
    
    func plus(a:Int,b: Int) -> Int {
        return a + b
    }
    
    func mult(a: Int,b : Int) -> Int {
        return a * b
    }
    
    func someFunction(p: (Int,Int) -> Int,a: Int,b: Int) -> Void {
        
        print(plus(a: a, b: b))
    }
    
    
    
    
    
    
    
}



