//
//  So18.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/2.
//

// 剑指 Offer 18. 删除链表的节点
class So18 {
    
    func deleteNode(_ head: ListNode?, _ val: Int) -> ListNode? {
        guard head != nil else {
            return head
        }
        if head!.val == val {
            return head?.next
        }
        var cur = head
        var pre = head
        while cur != nil && cur!.val != val {
            pre = cur
            cur = cur?.next
        }
        // 如果 list里面没有val 也会推出 cur = nil  pre指向最后一个元素   那么pre.next 依然成立
        pre?.next = cur?.next
        
        return head
    }
    
    // 使用亚结点
    func deleteNode2(_ head: ListNode?, _ val: Int) -> ListNode? {
        guard head != nil else {
            return head
        }
        
        var dumpty:ListNode? = ListNode(-1)
        dumpty?.next = head
        var temp = dumpty
        
        var cur = head
        
        while cur != nil {
            if cur!.val == val {
                temp?.next = cur?.next
                temp = temp?.next
            } else {
                temp = cur
            }
            cur = cur?.next
        }
        
        return dumpty?.next
    }
    
}
