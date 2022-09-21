//
//  Solution_328.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/8/26.
//


/*
    考察点：双指针在链表中的技巧 -> 分隔链表

    思路：原链表1分为2  拆分成l1和l2  拆分规则可以是奇偶 可以是大于某个数值
    然后 p1在l1上游走 p2在l2上游走  p在原本的链表上游走
    最后把两个链表p1和p2拼接在一起
   
    模版：
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
    最后记得拼接
    odd?.next = eventHead
    event?.next = nil
 
    
    分割链表  从里面分拣 然后合并  只是分拣条件不同
    cur.val < x {
        挂到小链表后面
    }else {
        挂到大链表后面
    }
 
    奇偶链表  从里面分拣 然后合并
    if 是奇数 {
       挂到奇数链表后面
    }else {
       挂到偶数链表后面
    }

 类似题目：
 leetcode 86、 分隔链表
 leetcode 328、奇偶链表
*/


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
