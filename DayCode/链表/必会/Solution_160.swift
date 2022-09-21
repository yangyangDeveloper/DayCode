//
//  Solution_160.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/7/22.
//

/*
    考察点： 双指针在链表中应用 -> 判断两个链表是否相交找出交点
    思路：
    l1: a1->a2->c1->c2
    l2: b1->b2->b3->c1->c2
    我们把 l1 和 l2  拼接到一起
    指针1移动   a1->a2->c1->c2->b1->b2->b3->c1->c2
    指针2移动   b1->b2->b3->c1->c2->a1->a2->c1->c2
    总能找到 c1
 */
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
