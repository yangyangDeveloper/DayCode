//
//  Solution_206.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/7/22.
//


/*
   考察点：
   
   反转链表有很多种解法
   递归 和 非递归
   
   递归 分 前序递归 和 后序递归
   非递归 有 头插法 双指针 三指针
*/

// 206. 反转链表
class Solution_206 {
    
    // MARK: -  三指针
    func reverseList(_ head: ListNode?) -> ListNode? {
        if head == nil { return nil }
        var begin:ListNode?
        var mid = head
        var end = mid?.next
        while 1 != 0 {
            mid?.next = begin
            if end == nil {
                break
            }
            begin = mid
            mid = end
            end = end?.next
        }
        return mid
    }
    
    
    // MARK: - 头插法
    func reverseList2(_ head: ListNode?) -> ListNode? {
        if head == nil { return nil }
        var temp:ListNode?
        var newhead:ListNode?
        var cur = head
        while cur != nil {
            temp = cur
            // 将 temp 从 head 中摘除
            cur = cur?.next
            
            // 将 temp 插入到 new_head 的头部
            temp?.next = newhead
            newhead = temp
        }
        return newhead
    }
    
    
    // MARK: - 双指针
    func reverseList3(_ head: ListNode?) -> ListNode? {
        if head == nil { return nil }
        var pre:ListNode?
        var cur = head
        while cur != nil {
            var temp = cur?.next
            cur?.next = pre
            pre = cur
            cur = temp
        }
        return pre
    }
    
    // MARK: -  递归反转
    func reverseList4(_ head: ListNode?) -> ListNode? {
        if head == nil { return nil }
        return reverse(head)
        
        // 1到n反转
        //return reverseN(head, 3)
        
        // 区间反转
        //return reverseBetween(head, 2, 4)
    }
    
    // 完全反转

    func reverse(_ head: ListNode?) -> ListNode? {
        // base case
        // 如果链表为空或者只有一个链表时候 反转结果就是他自己 直接返回就可以
        if head == nil || head?.next == nil {
            return head
        }
        
        // 一直递归，找到链表中最后一个节点last
        var node = reverse(head?.next)
        head?.next?.next = head
        // head变成了末尾 让反转之后的 head 节点指向nil
        head?.next = nil
        
        return node
    }
    
    // 反转 【1 n】 链表索引从1开始
    /*
        1、base case 变为 n == 1，反转一个元素，就是它本身，同时要记录后驱节点。
        
     */
    var temp: ListNode?
    func reverseN(_ head: ListNode?, _ n: Int) -> ListNode? {
        print("n==\(n)")
        
        // base case
        if n == 1 {
            // 记录第 n + 1个节点
            temp = head?.next
            print("当前head=\(head), temp=\(temp)")
            return head
        }
    
        //  以 head.next 为起点，需要反转前 n - 1 个节点
        var node = reverseN(head?.next, n - 1)
        
        head?.next?.next = head
        // 让反转之后的 head 节点和后面的节点连起来
        head?.next = temp
        return node
    }

    // 反转一个索引区间[m n] 索引从 1 开始 仅仅反转区间内
    func reverseBetween(_ head: ListNode?, _ m: Int, _ n: Int) -> ListNode? {
        // base case
        if m == 1 {
            return reverseN(head, n)
        }
        
        // 前进到反转的起点触发 base case
        head?.next = reverseBetween(head?.next, m - 1, n - 1)
        return head
    }
}
