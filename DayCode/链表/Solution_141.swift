//
//  Solution_141.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/8/2.
//

// 环形链表
class Solution_141 {
    func hasCycle(_ head: ListNode?) -> Bool {
        if head == nil { return false }
        var slow = head
        var fast = head
        
        while fast != nil {
            slow = slow?.next
            fast = fast?.next?.next
            if slow === fast {
                return true
            }
        }
        return false
    }
}
