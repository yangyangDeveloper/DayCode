//
//  Solution_237.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/8/27.
//


class Solution_237 {
    func deleteNode(_ node: ListNode?) {
        if node == nil && node!.next == nil {
            return
        }
        node!.val = node!.next!.val
        node!.next = node!.next!.next
    }
}
