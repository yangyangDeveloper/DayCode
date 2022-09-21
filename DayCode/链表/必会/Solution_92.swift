//
//  Solution_92.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/19.
//


/*
  考察： 后序递归遍历理解的深度  
  1、最基础： 整体后序递归反转链表
  2、升级：  反转链表前n个节点
  
  衍生：  反转【left right】  这里想办法一步步的 变化到 反转【1 n】的模型里面
 
 */

// 92. 反转链表 II
class Solution_92 {
    
    func reverseBetween(_ head: ListNode?, _ left: Int, _ right: Int) -> ListNode? {
        if head == nil {
            return head
        }
        if left == 1 {
            return reverseN(head, right)
        }
        head?.next = reverseBetween(head?.next, left - 1, right - 1)
        return head
    }

    // 反转前n个节点
    var temp: ListNode?
    
    // 反转 【1 n】 链表索引从1开始
    func reverseN(_ head: ListNode?, _ n: Int) -> ListNode? {
        // base case
         if n == 1 {
             temp = head?.next
             return head
         }
         var node = reverseN(head?.next, n - 1)
         head?.next?.next = head
         head?.next = temp
         return node
    }
}
