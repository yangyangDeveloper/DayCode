//
//  Solution_83.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/8/30.
//

/*
    考察点： 双指针在链表中的技巧 -> 快慢指针取出重复元素

    思路： fast逐个前进 当和slow不同时候 在给你slow保管
    [0 slow]为不重复期间

    本题： 链表和数组的思想是一样的 只是链表还需要额外做一步
    slow.next = nil  断开操作

    类似题：
    leetcode26  删除有序数组中的重复项」 一个模版
*/

// 83. 删除排序链表中的重复元素
class Solution_83 {
    
     // 套用快慢指针模版
     // [0 slow] 全是不重复的   fast逐个前进 当和slow不同时候 在给你slow保管
     func deleteDuplicates3(_ head: ListNode?) -> ListNode? {
         if head == nil {
             return nil
         }
         
         var slow = head
         var fast = head
         
         while fast != nil {
             if fast?.val != slow?.val {
                 // 相当于 slow += 1
                 // nums[slow] = nums[fast]
                 
                 slow?.next = fast
                 slow = slow?.next
             }
             // 相当于 fast += 1
             fast = fast?.next
         }
         
         // 断开链接
         slow?.next = nil
         
         return head
     }
    
    
    
    func deleteDuplicates2(_ head: ListNode?) -> ListNode? {
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
    
    
    // 时间复杂度 o(n) 空间复杂度o(1)
    // 这种写法复杂了  套用的亚节点
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
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
}

