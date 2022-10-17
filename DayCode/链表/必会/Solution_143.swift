//
//  Solution_143.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/10/17.
//

import Foundation
// 143. 重排链表

class Solution_143 {

    /*
        用栈去维护
    */
    func reorderList(_ head: ListNode?) {
        var stack = [ListNode?]()
        var cur = head
        while cur != nil {
            stack.append(cur)
            cur = cur?.next
        }

        cur = head

        while cur != nil {

            var lastNode = stack.removeLast()
            var next = cur?.next
            if lastNode === next || lastNode?.next === next {
                lastNode?.next = nil
                break
            }
            cur?.next = lastNode
            lastNode?.next = next
            cur = next
        }
    }
}
