//
//  So9.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/1.
//

// 剑指 Offer 09. 用两个栈实现队列
class So9 {
    
    class CQueue {
        var inputList:[Int] = [Int]()
        var outputList:[Int] = [Int]()
        init() {
            
        }
        
        func appendTail(_ value: Int) {
            inputList.append(value)
        }
        
        func deleteHead() -> Int {
            // 第二个栈为空
            if outputList.isEmpty == true {
                // 先清空第一个栈 放到第二个栈内
                while inputList.isEmpty == false {
                    outputList.append(inputList.popLast()!)
                }
                // 放完之后 如果第二个栈 有数据了 那么移除
                if outputList.isEmpty == false {
                    return outputList.popLast()!
                }
                // 否则 返回 -1
                else {
                    return -1
                }
            }
            // 第二个栈有数据
            else {
                return outputList.popLast()!
            }
        }
    }
}
