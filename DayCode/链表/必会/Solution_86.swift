//
//  Solution_86.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/8/30.
//

/*
    考察： 拆分单链表 最后合并
    二刷时候 一开始没有思路
    
    leetcode 328奇偶链表
    分隔链表 和 328题相识
    奇偶链表  从里面分拣 然后合并
    if 是奇数 {
       挂到奇数链表后面
    }else {
       挂到偶数链表后面
    }

    分割链表  从里面分拣 然后合并  只是分拣条件不同
    cur.val < x {
        挂到小链表后面
    }else {
        挂到大链表后面
    }

*/

// 86. 分隔链表
class Solution_86 {
    
    func partition2(_ head: ListNode?, _ x: Int) -> ListNode? {
    
        var small = ListNode(-1)
        let smallHead = small
        
        var big = ListNode(-1)
        let bigHead = big
        
        var cur = head
        while cur != nil {
            
            if cur!.val < x {
                small.next = cur
                small = small.next!
              
            } else {
                big.next = cur
                big = big.next!
            }
            cur = cur?.next
        }
        
        small.next = bigHead.next
        big.next = nil
        return smallHead.next
    }
    
    
    // 时间复杂度o(n) 空间复杂度o(1)


    func partition(_ head: ListNode?, _ x: Int) -> ListNode? {
        guard head != nil else { return head }
        var small:ListNode? = ListNode(-1)
        var smallHead = small
        var big:ListNode? = ListNode(-1)
        var bigHead = big
        var cur = head
        
        while cur != nil {
            
            if cur!.val < x {
                small?.next = cur
                small = small?.next
            }else {
                big?.next = cur
                big = big?.next
            }
            
            cur = cur?.next
        }
        
        big?.next = nil
        small?.next = bigHead?.next
        return smallHead?.next
    }
}
