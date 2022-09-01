//
//  Solution_876.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/8/29.
//

// 876. 找中间结点
class Solution_876 {
    func middleNode(_ head: ListNode?) -> ListNode? {
        guard head != nil else { return head }
        var n = 0
        var cur = head
        while cur != nil {
            n += 1
            cur = cur?.next
        }

        let size = n / 2
        cur = head
        for i in 0 ..< size {
            cur = cur?.next
        }
        return cur
    }
}

