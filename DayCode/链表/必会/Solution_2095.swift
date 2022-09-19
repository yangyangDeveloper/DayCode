//
//  Solution_2095.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/19.
//

/*
    考察点：查询链表中心节点的技巧
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
