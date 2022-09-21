//
//  Solution_141.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/8/2.
//

/*
    考察点： 双指针在链表中的技巧 -> 判断单链表是否有环技巧

    模版
    while fast != nil && fast?.next != nil  {
        fast = fast?.next?.next
        slow = slow?.next
         // 双指针相遇 说明有环
        if slow === fast {
             return true
        }
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
            // 双指针相遇 说明有环
            if slow === fast {
                return true
            }
        }
        return false
    }
}
