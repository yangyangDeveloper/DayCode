//
//  Solution_876.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/8/29.
//

/*
 
   考察点： 链表找中心点的技巧
   是个固定模版
   while fast != nil && fast?.next != nil  {
      fast = fast?.next?.next
      slow = slow?.next
   }
    0 1 2 3 4  返回2
    0 1 2 3    返回2
 */

// 876. 找中间结点
class Solution_876 {
    
    func middleNode2(_ head: ListNode?) -> ListNode? {
        
        if head == nil {
            return head
        }

        var slow = head
        var fast = head

        // 获取中间节点
        while fast != nil && fast?.next != nil  {
            fast = fast?.next?.next
            slow = slow?.next
        }
        return slow
    }
    
    
    func middleNode(_ head: ListNode?) -> ListNode? {
        guard head != nil else { return head }
        var n = 0
        var cur = head
        while cur != nil {
            n += 1
            cur = cur?.next
        }

        let size = n / 2
        cur = head
        for i in 0 ..< size {
            cur = cur?.next
        }
        return cur
    }
    

}

