//
//  So6.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/2.
//

// 剑指 Offer 06. 从尾到头打印链表
class So6 {
    // 遍历元素入栈
    // 出栈加入数据
    func reversePrint(_ head: ListNode?) -> [Int] {
        guard head != nil else {
            return []
        }
        var stack = [Int]()
        var cur = head
        var arr = [Int]()
        
        while cur != nil {
            stack.append(cur!.val)
            cur = cur?.next
        }
        
        while stack.count > 0 {
            arr.append(stack.removeLast())
        }
        return arr
    }
}
