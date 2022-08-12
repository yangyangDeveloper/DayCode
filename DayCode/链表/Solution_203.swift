//
//  Solution_203.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/8/2.
//

// 移除链表元素
class Solution_203 {
    
    func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
        if head == nil { return nil }
        var dum = ListNode(-1)
        var per = dum
        dum.next = head
        
        var cur = head
        
        while cur != nil {
            if cur?.val != val {
                per.next = cur
                per = per.next!
            }
            cur = cur?.next
        }
        per.next = nil
        return dum.next
    }
    
    // 添加一个虚拟头结点
    func removeElements2(_ head: ListNode?, _ val: Int) -> ListNode? {
        if head == nil { return nil }
        var dum = ListNode(-1)
        dum.next = head
        var per = dum
        while per.next != nil {
            if per.next?.val == val {
                per.next = per.next?.next
            } else {
                per = per.next!
            }
        }
        return dum.next
    }
    
}
