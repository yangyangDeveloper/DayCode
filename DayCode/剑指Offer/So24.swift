//
//  So24.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/2.
//

// 剑指 Offer 24. 反转链表
class So24 {
    // 3指针
    func reverseList(_ head: ListNode?) -> ListNode?  {
        guard head != nil else {
            return head
        }
        
        var pre: ListNode?
        var mid = head
        var end = mid?.next
        
        while 1 > 0 {
            
            mid?.next = pre
            
            if end == nil {
                break
            }
            
            pre = mid
            mid = end
            end = end?.next
        }
        
        return mid
    }
    
    // 新头节点  + 头插法
    func reverseList2(_ head: ListNode?) -> ListNode?  {
        guard head != nil else {
            return head
        }
        
        var newhead: ListNode?
        var cur = head
        
        while cur != nil {
            var temp = cur?.next
            cur?.next = newhead
            newhead = cur
            cur = temp
        }
        return newhead
    }
}
