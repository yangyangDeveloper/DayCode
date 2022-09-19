//
//  Solution_141.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/8/2.
//

/*
    考察点：判断单链表是否有环技巧
    有固定模版
 while fast != nil && fast?.next != nil  {
     fast = fast?.next?.next
     slow = slow?.next
 }
 */

// 环形链表
class Solution_141 {
    func hasCycle(_ head: ListNode?) -> Bool {
        if head == nil { return false }
        var slow = head
        var fast = head
        
        while fast != nil && fast?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
            if slow === fast {
                return true
            }
        }
        return false
    }
}
