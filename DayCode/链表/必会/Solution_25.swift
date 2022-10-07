//
//  Solution_25.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/10/6.
//

/*
   考察点： k个一组反转链表
*/

class Solution_25 {
    
    // 迭代方式 反转  链表可以递归 可以迭代
    /*
     
     终止条件： 当没有交换时候递归就终止， 因此当链表只剩下一个节点 或者没有节点时候 递归自然结束
     返回值： 我们希望往上一级递归返回什么？ 希望提交给上一级递归的是已经完成交换的链表
     本级递归应该做什么： 只考虑本级递归 本级递归就是交换这个3个节点中的前两个
     
     上级 ——> head ->next->已经处理完的链表
     
     本级递归应该做的是
     
     上级->next ->head -> 已处理完的链表
     
     递归函数主体部分的任务就是简单的交换3个节点的前2个结点而已
     
     */
    func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
        if head == nil  {
            return nil
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

        // 本级递归反转【a,b)
        var newHead = traverse(a, b)

        a?.next = reverseKGroup(b, k)
        return newHead
    }
    
    // 反转 [a,b)
    func traverse(_ head: ListNode?, _ b: ListNode?) -> ListNode? {
        var pre:ListNode?
        var cur = head
        var net = head
        while cur !== b {
            net = cur?.next
            cur?.next = pre
            pre = cur
            cur = net
        }
        // pre 为newhead   cur  指向了 b
        return pre
    }
}
