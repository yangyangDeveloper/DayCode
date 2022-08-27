//
//  Solution_328.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/8/26.
//

// 328. 奇偶链表
class Solution_328 {
    
    //  双指针 遍历 采集奇偶  最后拼接2个链表
    func oddEvenList(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil || head?.next?.next == nil {
            return head
        }
        // 偶链表头部
        var eventHead = head?.next
        
        // 定义2个指针 记录 奇偶位置
        var odd = head  // 奇数
        var event = head?.next // 偶数
        
        var f = true //  奇为true 偶为false
        
        var cur = head
        cur = cur?.next?.next
        
        while cur != nil {
            if f {
                odd?.next = cur
                odd = odd?.next
            } else {
                event?.next = cur
                event = event?.next
            }
            f = !f
            cur = cur?.next
        }
        // 拼接
        odd?.next = eventHead
        event?.next = nil
        return head
    }
}
