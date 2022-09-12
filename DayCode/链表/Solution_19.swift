//
//  Solution_19.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/8/27.
//

// 19. 删除链表的倒数第 N 个结点
class Solution_19 {
    // 1、 求链表长度
    // 2、 找到删除点之前的点   length - n - 1 就是该节点
    // 3、 考虑首节点 需要临时节点  length = n
    
    
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        guard head != nil else { return nil }
        var cur = head
        var length = 0
        while cur != nil {
            length += 1
            cur = cur?.next
        }
        // 删除首节点
        if length == n {
            return head?.next
        }
        
        // 删除其他节点
        var pre = head
        var last = length - n - 1
        for i in 0 ..< last {
            pre = pre?.next
        }
        pre?.next = pre?.next?.next

        return head

    }
}
