//
//  Solution_86.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/8/30.
//

// 86. 分隔链表
class Solution_86 {
    // 时间复杂度o(n) 空间复杂度o(1)
    // 1 双指针 记录头部  临时节点
    // 2 遍历链表  x 为界 分成双链表
    // 3 合并链表
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
