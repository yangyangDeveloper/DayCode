//
//  Solution_876.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/8/29.
//

/*
   考察点： 双指针在链表中的技巧 -> 快慢指针找链表中心点
   思想： fast走2步  slow走1步   偶数链表 fast.next为空 slow在 中间     奇数链表 fast为nil  slow指向中间的右边
   模版
   while fast != nil && fast?.next != nil  {
      fast = fast?.next?.next
      slow = slow?.next
   }
    0 1 2 3 4   链表中心点只有2   返回2
    0 1 2 3     链表中心点右 1 2  但是返回2
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

