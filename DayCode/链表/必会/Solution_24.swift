//
//  Solution_24.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/8/23.
//

/*
    考察点：node1 和 node2 交换
    1、 subhead记录node1
    2、 temp处于 node1 和 node2 之前
 */

// 24. 两两交换链表中的节点
class Solution_24 {
    

    func swapPairs(_ head: ListNode?) -> ListNode? {
        guard head != nil else { return nil }
        var dumpty = ListNode(-1)
        dumpty.next = head
        var pre = dumpty
        
        while pre.next != nil && pre.next?.next != nil {
            
            var node1 = pre.next
            var node2 = pre.next?.next
            var subhead = node2?.next
            
            node2?.next = node1
            node1?.next = subhead
            pre.next = node2
            
            pre = node1!
        }
    
        return dumpty.next
    }
}
