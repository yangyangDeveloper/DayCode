//
//  Solution_86.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/8/30.
//

/*
    考察点：双指针在链表中的技巧 -> 分隔链表

    思路：原链表1分为2  拆分成l1和l2  拆分规则可以是奇偶 可以是大于某个数值
    然后 p1在l1上游走 p2在l2上游走  p在原本的链表上游走
    最后把两个链表p1和p2拼接在一起
   
    模版：
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
    最后记得拼接
    small.next = bigHead.next
    big.next = nil
 
    
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
 分隔链表 和 奇偶链表
 leetcode 86、 分隔链表
 leetcode 328、奇偶链表
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
