//
//  Solution_83.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/8/30.
//

// 83. 删除排序链表中的重复元素
class Solution_83 {
    // 时间复杂度 o(n) 空间复杂度o(1)
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        guard head != nil else { return head }
        var cur = head
        
        while cur != nil && cur!.next != nil {
            if cur!.val == cur!.next!.val {
                cur?.next = cur?.next?.next
            } else {
                cur = cur?.next
            }
        }
        return head
    }
}
