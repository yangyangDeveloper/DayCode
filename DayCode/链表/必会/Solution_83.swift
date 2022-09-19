//
//  Solution_83.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/8/30.
//

/*
   考察的是 删除链表
   基础： 出现重复的留一个
   升级： 凡事重复的全部扔掉
   
 */

// 83. 删除排序链表中的重复元素
class Solution_83 {
    // 时间复杂度 o(n) 空间复杂度o(1)

    // 删除写复杂了 当时想用一个 dumpty 实际上不需要使用 dumpty
    func deleteDuplicates2(_ head: ListNode?) -> ListNode? {
        if head == nil {
            return head
        }

        var cur = head
        var dumpty:ListNode? = ListNode(-1)
        var temp:ListNode? = dumpty
        dumpty?.next = head

        while cur != nil {
            if temp?.next?.val  == temp?.next?.next?.val {
                temp?.next = temp?.next?.next
            } else {
                temp = temp?.next
            }

            cur = cur?.next
        }

        return dumpty?.next
    }
    
    
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

