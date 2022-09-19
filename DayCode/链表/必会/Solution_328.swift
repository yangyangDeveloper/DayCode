//
//  Solution_328.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/8/26.
//

/*
  考察的是 拆分2个链表 然后合并
  leetcode 86题 是一个套路 只是比较的方式不一样
  都是拆分2个链表
 */

// 328. 奇偶链表
class Solution_328 {
 
    
    func oddEvenList3(_ head: ListNode?) -> ListNode? {
        if head == nil  {
            return head
        }
        var isodd = true
        var cur = head
        
        var odd = ListNode(-1)
        var even = ListNode(-1)
        var oddhead = odd
        var evenhead = even
        
        while cur != nil {
            // 是奇数
            if isodd {
                odd.next = cur
                odd = odd.next!
            } else { //偶数
                even.next = cur
                even = even.next!
            }
            cur = cur?.next
            isodd = !isodd
        }
        
        // 拼接
        odd.next = evenhead.next
        even.next = nil
        return oddhead.next
    }
    
    
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
    
    
    // MARK: - 效率更高
    // 2个链表 l1 l2  然后分拣 head
    // 合并链表   l1.next = l2  l2.尾巴  = nil
    func oddEvenList2(_ head: ListNode?) -> ListNode? {

        if head == nil {
            return head
        }

        // 记录头部
        // 奇数
        var odd = head
        //  偶数
        var even = head?.next
        var evenhead = even

        while even != nil && even?.next  != nil {
            odd?.next = odd?.next?.next
            odd = odd?.next

            even?.next = even?.next?.next
            even = even?.next
        }
        
        odd?.next = evenhead
        return head
    }
}
