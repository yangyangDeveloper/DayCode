//
//  So22.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/2.
//

// 剑指 Offer 22. 链表中倒数第k个节点
class So22 {
    // 双指针 通向 差距为k 快指针移动k步  等快指针指向nil时候  满指针就是 所要找的元素
    func getKthFromEnd(_ head: ListNode?, _ k: Int) -> ListNode? {
        guard head != nil else {
            return head
        }
        var cur = head
        var fast = head
        
        var n = k
        while n > 0 {
            fast = fast?.next
            n -= 1
        }
        
        while fast != nil {
            fast = fast?.next
            cur = cur?.next
        }
        return cur
    }
}
