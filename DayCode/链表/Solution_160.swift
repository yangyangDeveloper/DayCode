//
//  Solution_160.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/7/22.
//

// 双指针
// 160. 相交链表
class Solution_160 {
    func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        if headA == nil || headB == nil {
            return nil
        }
        var t1 = headA
        var t2 = headB
        while t1 !== t2 {
            t1 = t1 == nil ? headB : t1?.next
            t2 = t2 == nil ? headA : t2?.next
        }
        return t1
    }
}
