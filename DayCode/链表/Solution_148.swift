//
//  Solution_148.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/8/31.
//

// 148. 排序链表
class Solution_148 {
    // 时间复杂度 logn
    func sortList(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil {
            return head
        }
    
    
        let mid = getMidNode(head)
        let t = mid?.next
        mid?.next = nil
        
        var l1 = sortList(head)
        var l2 = sortList(t)
        
        return merge(l1, l2)
        
    }
    
    //  找到链表中间节点
    //  偶数返回中间  奇数返回中间左边
    func getMidNode(_ head: ListNode?) -> ListNode? {
        if head == nil { return head }
        var slow = head
        var fast = head
        // 返回 偶数中间 奇数中间靠左
        while fast?.next != nil && fast?.next?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
        }
        
        // 返回 偶数中间 奇数中间靠右
//        while fast != nil && fast?.next != nil {
//            slow = slow?.next
//            fast = fast?.next?.next
//        }
        
        return slow
    }
    
    // 合并
    func merge(_ node1: ListNode?, _ node2: ListNode?) -> ListNode? {
        var dumpty = ListNode(-1)
        dumpty.next = node1
        var cur = dumpty
        
        var t1 = node1
        var t2 = node2
        
        while t1 != nil && t2 != nil {
            if t1!.val < t2!.val {
                cur.next = t1
                t1 = t1?.next
                cur = cur.next!
            } else {
                cur.next = t2
                t2 = t2?.next
                cur = cur.next!
            }
        }
        if t1 != nil {
            cur.next = t1
        }
        
        if t2 != nil {
            cur.next = t2
        }
        return dumpty.next
    }
    
    
    // func merge(_ node1: ListNode?, _ node2: ListNode?) -> ListNode? {

    //     var head1 = node1
    //     var head2 = node2
    //     var dumpty:ListNode? = ListNode(-1)
    //     var temp = dumpty

    //     while head1 != nil && head2 != nil {
    //         if head1!.val < head2!.val {
    //             temp?.next = head1
    //             temp = temp?.next
    //             head1 = head1?.next
    //         } else {
    //             temp?.next = head2
    //             temp = temp?.next
    //             head2 = head2?.next
    //         }
    //     }
    //     // 一旦有提前结束的

    //     if head1 != nil {
    //         temp?.next = head1
    //     }

    //     if head2 != nil {
    //         temp?.next = head2
    //     }

    //     return dumpty?.next
    // }
    
    
}
