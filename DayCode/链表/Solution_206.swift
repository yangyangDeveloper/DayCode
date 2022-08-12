//
//  Solution_206.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/7/22.
//

import Foundation

// 206. 反转链表
class Solution_206 {
    func reverseList(_ head: ListNode?) -> ListNode? {
        if head == nil { return nil }
        var temp:ListNode?
        var newhead:ListNode?
        var cur = head
        while cur != nil {
            temp = cur
            cur = cur?.next
            temp?.next = newhead
            newhead = temp
        }
        return newhead
    }
    
    func reverseList2(_ head: ListNode?) -> ListNode? {
        if head == nil { return nil }
        var begin:ListNode?
        var mid = head
        var end = mid?.next
        while 1 != 0 {
            mid?.next = begin
            if end == nil {
                break
            }
            begin = mid
            mid = end
            end = end?.next
        }
        return mid
    }
}
