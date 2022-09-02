//
//  So25.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/2.
//

// 剑指 Offer 25. 合并两个排序的链表
class So25 {
    // 设置亚结点 作为新链表头节点之前的节点  设置一个temp指针 指向虚节点
    // 头到尾遍历2个链表 2个指针记录元素  把最小的放到temp后面 然后相应的链表节点往后移动
    // 循环摘取 剩余合并
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        guard l1 != nil && l2 != nil else {
            return l1 == nil ? l2 : l1
        }
        
        var dumpty:ListNode? = ListNode(-1)
        var temp = dumpty
        
        var t1 = l1
        var t2 = l2
        
        while t1 != nil && t2 != nil {
            if t1!.val < t2!.val {
                temp?.next = t1
                t1 = t1?.next
                temp = temp?.next
            } else {
                temp?.next = t2
                t2 = t2?.next
                temp = temp?.next
            }
        }
        
        if t1 != nil {
            temp?.next = t1
        }
        
        if t2 != nil {
            temp?.next = t2
        }
        
        return dumpty?.next
    }
}
