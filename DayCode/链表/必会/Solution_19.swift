//
//  Solution_19.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/8/27.
//


/*
   考察点： 双指针在链表中的技巧 -> 查找单链表的倒数第k个节点的技巧
 
   思想： p1先走k步   然后head位置new一个p2  接着两者再一起走n-k步  p1就指向了nil  p2指向了倒数第k个节点
   这属于一个技巧吧
   
    模版：
    寻找倒数第k个节点
     var p1 = head
     for i in 0..<n {
         p1 = p1?.next
     }
     
     var p2 = head
     while p1 != nil {
         p1 = p1?.next
         p2 = p2?.next
     }
     return p2
   
   
   本题目是让删除倒数第k个节点
   可以拆分为：
    1 找到倒数第k个节点的前驱 也就是k+1 (注意是倒数，所以k+1 是前驱  不要去找k - 1)
    2、通过前驱x.next = x.next.next  完成删除操作
    
     var dumpty = ListNode(-1)
     dumpty.next = head
     // 找到倒数第k个节点的前驱 也就是 n + 1
     var x = findEnd(dumpty, n + 1)
     x?.next = x?.next?.next
     return dumpty.next
*/

// 19. 删除链表的倒数第 N 个结点
class Solution_19 {

    func removeNthFromEnd2(_ head: ListNode?, _ n: Int) -> ListNode? {
        if head == nil {
            return nil
        }
        var dumpty = ListNode(-1)
        dumpty.next = head
        // 删除倒数第n个节点 需要先找到前驱 也就是n + 1 (注意这里是倒数第n个)
        var x = findEnd(dumpty, n + 1)
        x?.next = x?.next?.next
        return dumpty.next
    }
    
    func findEnd(_ head: ListNode?, _ n: Int) -> ListNode?  {
        var p1 = head
        
        for i in 0..<n {
            p1 = p1?.next
        }
        
        var p2 = head
        while p1 != nil {
            p1 = p1?.next
            p2 = p2?.next
        }
        return p2
    }
    
    // 1、 求链表长度
    // 2、 找到删除点之前的点   length - n - 1 就是该节点
    // 3、 考虑首节点 需要临时节点  length = n
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        guard head != nil else { return nil }
        var cur = head
        var length = 0
        while cur != nil {
            length += 1
            cur = cur?.next
        }
        // 删除首节点
        if length == n {
            return head?.next
        }
        
        // 删除其他节点
        var pre = head
        var last = length - n - 1
        for i in 0 ..< last {
            pre = pre?.next
        }
        pre?.next = pre?.next?.next

        return head
    }
}
