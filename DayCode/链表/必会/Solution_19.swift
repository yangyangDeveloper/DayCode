//
//  Solution_19.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/8/27.
//


/*
   考察点： 查找单链表的倒数第k个节点的技巧
   有几个边界需要想清楚
   倒数第k个   k - n - 1   k - n   各自的意思
   
   1->2->3->4->nil
   假设 n = 4个节点  k = 1  删除到底第k个节点
   1、 p1 移动k位   也就是1次  来到 2
   2、 设置 p2 = 1   p1 p2 再移动 n - k(也就是3)  p1 就来到了 nil  p2就来到了倒数第k元素
   
   继续往下看
   正常的需要 遍历一遍 得到长度 n   然后在for一次 来到 n - k - 1 才找到 倒数第k个节点
   而这里有一个技巧  只需要一次遍历

   ListNode p1 = head;
    // p1 先走 k 步
    for (int i = 0; i < k; i++) {
        p1 = p1.next;
    }
    ListNode p2 = head;
    // p1 和 p2 同时走 n - k 步
    while (p1 != null) {
        p2 = p2.next;
        p1 = p1.next;
    }
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
