//
//  Solution_82.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/8/30.
//

// 82. 删除排序链表中的重复元素 II
class Solution_82 {
    //  时间复杂度 o(n) 空间复杂度o(1)
    //  临时节点
    //  需要一个虚拟头结点，然后用变量prev指向该虚拟头结点。这样在删除重复结点之后，剩余的结点就可以挂在prev之后继续考察
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        guard head != nil else { return head }
        var dumpty = ListNode(-1)
        dumpty.next = head
        var cur = dumpty
        while cur.next != nil && cur.next?.next != nil {
            if cur.next?.val == cur.next?.next?.val {
                let t = cur.next?.val
                while cur.next != nil && cur.next?.val == t {
                    cur.next = cur.next?.next
                }
            }else {
                cur = cur.next!
            }
        }
        return dumpty.next
    }
    
    func deleteDuplicates2(_ head: ListNode?) -> ListNode? {
        guard head != nil else { return head }
        var dumpty = ListNode(-1)
        dumpty.next = head
        var pre = dumpty
        var cur = head
        
        while cur != nil  {
            var curRepCount = 0
            var difNode = cur
            while difNode != nil && difNode!.val == cur!.val {
                curRepCount += 1
                difNode = difNode?.next
            }
            if curRepCount > 1 {
                pre.next = difNode
            }else {
                pre = cur!
            }
            cur = difNode
        }
        return dumpty.next
    }
}
