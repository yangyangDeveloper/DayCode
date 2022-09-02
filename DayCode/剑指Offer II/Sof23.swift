//
//  Sof23.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/2.
//

// 剑指 Offer II 023. 两个链表的第一个重合节点
class Sof23 {
    // 3 5
    // 4 5
    // 3 + 5 + 4
    // 4 + 5 + 3
    // 双指针 循环遍历 找相同点
    
    func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        guard headA != nil && headB != nil else {
            return headA == nil ? headB : headA
        }
        
        var t1 = headA
        var t2 = headB
        
        // 自己走完之后 移动指针到新的链表头部
        while t1 !== t2 {
            t1 = t1 == nil ? headB : t1?.next
            t2 = t2 == nil ? headA : t2?.next
        }
        
        return t1
    }
}
