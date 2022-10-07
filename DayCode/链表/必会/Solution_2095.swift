//
//  Solution_2095.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/19.
//

/*
     考察点： 双指针在链表中的技巧 -> 快慢指针找链表中心点
     思想：
     fast走2步  slow走1步   偶数链表 fast.next为空 slow在 中间     奇数链表 fast为nil  slow指向中间的右边
     模版
     while fast != nil && fast?.next != nil  {
        fast = fast?.next?.next
        slow = slow?.next
     }
      0 1 2 3 4   链表中心点只有2   返回2
      0 1 2 3     链表中心点右 1 2  但是返回2
 */

// 2095. 删除链表的中间节点
class Solution_2095 {
    func deleteMiddle(_ head: ListNode?) -> ListNode? {
        if head == nil {
            return head
        }
        if head?.next == nil {
            return nil
        }
        var slow = head
        var fast = head
        var pre:ListNode?  // 中间点前驱
        while fast != nil && fast?.next != nil {
            fast = fast?.next?.next
            pre = slow
            slow = slow?.next
        }
        // 找到中心节点 slow 和 前驱 pre
        pre?.next = slow?.next
        return head
    }
}
