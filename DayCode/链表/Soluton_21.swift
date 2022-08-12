//
//  Soluton_21.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/8/2.
//

// 合并2个有序链表
class Solution_21 {
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        guard list1 != nil && list2 != nil else {
            return list1 == nil ? list2 : list1
        }
        var t1 = list1
        var t2 = list2
        var dumpty = ListNode(0)
        var per = dumpty
        
        while t1 != nil && t2 != nil {
            if let v1 = t1, let v2 = t2 {
                if v1.val < v2.val {
                    per.next = t1
                    t1 = t1?.next
                }
                else {
                    per.next = t2
                    t2 = t2?.next
                }
                per = per.next!
            }
        }
        
        if t1?.next != nil {
            per.next = t1
        }
        
        if t2?.next != nil {
            per.next = t2
        }
        
        return dumpty.next
    }
}
