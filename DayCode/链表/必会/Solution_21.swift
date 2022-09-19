//
//  Soluton_21.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/8/2.
//

/*
    考察：已经是分开的2个链表了，让我们合并单链表
    就是有一个亚节点  然后 不断的判断  最后合并到一起
    和下面2道题的套路差不多
    leetcode 328  奇偶链表
    leetcode 86   分割链表
*/
// 21. 合并两个有序链表
class Solution_21 {
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        
        guard list1 != nil || list2 != nil else {
            return  list1 == nil ?  list2 : list1
        }

        var dumpty = ListNode(-1)
        var temp = dumpty

        var t1 = list1
        var t2 = list2

        // 有一个为空就结束
        while t1 != nil  &&  t2 != nil {
            var temp1 = t1!.val
            var temp2 = t2!.val
            if temp1 < temp2 {
                temp.next = t1
                t1 = t1!.next
            } else {
                temp.next = t2
                t2 = t2!.next
            }
            temp = temp.next!
        }


        // 拼接
        if t1 != nil {
            temp.next = t1
        }
        if t2 != nil {
            temp.next = t2
        }

        return dumpty.next
    }
}
