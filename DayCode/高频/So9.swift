//
//  So9.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/1.
//

/*
  考察点： 栈和队列基本特性
 
 
 stack1
 
 stack2
 
 
 */
// 剑指 Offer 09. 用两个栈实现队列
class So9 {
    
    class CQueue {
        var stack1:[Int] = [Int]()
        var stack2:[Int] = [Int]()
        init() {
            
        }
        
        func appendTail(_ value: Int) {
            stack1.append(value)
        }
        
        func deleteHead() -> Int {
            if stack2.isEmpty {
                while !stack1.isEmpty {
                    stack2.append(stack1.removeLast())
                }
                if !stack2.isEmpty {
                    return stack2.removeLast()
                }
                else {
                    return -1
                }
            }
            else {
                return stack2.removeLast()
            }
        }
    }
}
