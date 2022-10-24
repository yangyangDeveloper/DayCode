//
//  Solution_24.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/8/23.
//

/*
   考察点：k个一组反转链表

   解法：
    1、 k个一组反转链表  两两交换
    2、 递归解决
    3、 subhead 记录 node1  temp处于  node1 和 node2 之前
 */

// 24. 两两交换链表中的节点
class Solution_24 {
    
    // 解法1  递归解法
    /*
      在递归的眼里 只有 3个节点
      上一级  first ->second->反转完成的链表reverseKGroup3(others)
      上一级  second->first->反转完成的链表reverseKGroup3(others)
      本级需要的就是交换  first  second  返回seconde给上一级
    */
    func reverseKGroup3(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil {
            return head
        }
        var cur = head
        var next = cur?.next
        cur?.next = reverseKGroup3(next?.next)
        next?.next = cur
        return next
    }
    
    
    // 解法2 迭代解法 subhead
    func swapPairs(_ head: ListNode?) -> ListNode? {
         var dumpty:ListNode? = ListNode(-1)
         var pre = dumpty
         dumpty?.next = head

         while pre?.next != nil && pre?.next?.next != nil {
             var node1 = pre?.next
             var node2 = pre?.next?.next
             // 防止链表断
             var subhead = node2?.next

             // 交换
             node2?.next = node1
             node1?.next = subhead

             // 拼接到pre后面
             pre?.next = node2

             // 移动 pre
             pre = node1
         }
         return dumpty?.next
    }
    
    // 解法3 套用 k个一组反转链表的模版
    func swapPairs2(_ head: ListNode?) -> ListNode? {
        return reverseKGroup(head,2)
    }
    
    // k个一组反转链表
    func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
        if head == nil || head?.next == nil {
            return head
        }
        var a: ListNode?
        var b: ListNode?
        a = head
        b = head
        for i in 0..<k {
            //  不足k个不需要反转
            if b == nil {
                return head
            }
            b = b?.next
        }

        // 反转前k个  
        var newHead = reverse(a, b)
        
        // 递归反转后拼接并连接
        a?.next = reverseKGroup(b, k)
        return newHead
    }


    // 反转区间 [a, b)
    func reverse(_ head: ListNode?, _ b: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil {
            return head
        }

        var pre:ListNode?
        var cur = head
        var nex = head

        while cur !== b {
            nex = cur?.next
            cur?.next = pre
            pre = cur
            cur = nex
        }
        return pre
    }
    
    

}
