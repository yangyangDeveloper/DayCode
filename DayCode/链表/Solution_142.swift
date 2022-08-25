//
//  Solution_142.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/8/25.
//

import Foundation
class Solution_142 {
    func detectCycle(_ head: ListNode?) -> ListNode? {
        guard head != nil  else { return nil }
        var mmp = [ListNode]()
        var cur = head
        while cur != nil {
            if mmp.contains(cur!) {
                return cur
            } else {
                mmp.append(cur!)
            }
            cur = cur?.next
        }
        return nil
    }
}
