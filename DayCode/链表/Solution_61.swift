//
//  Solution_61.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/8/28.
//

// 61. 旋转链表
class Solution_61 {
    
    /*
     1）先将链表闭合成环

     2）找到相应的位置断开这个环，确定新的链表头和链表尾
     
     3）找到新的尾部：(n - k % n - 1)
        找的新的头部：(n - k % n)
    */
    func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
        guard head != nil  || head?.next != nil else { return  head }
        
        var n = 1
        var cur = head
        var oldhead = head
        while cur?.next != nil {
            n += 1
            cur = cur?.next
        }
        cur?.next = head
        
        let size = n - k%n - 1
        var pre = head
        for i in 0 ..< size {
            pre = pre?.next
        }
        
        let newhead = pre?.next
        pre?.next = nil
        return newhead
    }
}
