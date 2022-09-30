//
//  Solution_92.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/19.
//


/*
  考察： 后序递归遍历理解的深度  
  1、最基础： 整体后序递归反转链表
  2、升级：  反转链表前n个节点
  
  衍生：  反转【left right】  这里想办法一步步的 变化到 反转【1 n】的模型里面
 
 */

// 92. 反转链表 II
class Solution_92 {
    
    func reverseBetween(_ head: ListNode?, _ left: Int, _ right: Int) -> ListNode? {
        if head == nil {
            return head
        }
        // 相当于反转 1到N 区间的链表
        if left == 1 {
            print("left=\(left)")
            print("right=\(right)")
            return reverseN(head, right)
        }
        
//        print("left=\(left)")
//        print("right=\(right)")
        
        // 假设right对应的 node 在原本链表的第4个位置  现在left 移除一个
        // 就形成了一个新链表了， 新链表的长度-1  那么right对应的node 在新链表的位置就是3个
        // 相当于摘出来一个子链表
        head?.next = reverseBetween(head?.next, left - 1, right - 1)
        return head
    }

    // 反转前n个节点
    var temp: ListNode?
    
    // 反转 【1 n】 链表索引从1开始
    func reverseN(_ head: ListNode?, _ n: Int) -> ListNode? {
        // base case
        // 当n = 1 时候 反转就是太自己 但是需要记录后取
         if n == 1 {
             temp = head?.next
             return head
         }
         
         // 从head.next 开始反转 节点数量需要 - 1
         var node = reverseN(head?.next, n - 1)
         head?.next?.next = head
         head?.next = temp
         return node
    }
    
    // 非递归解法
    
    // 1、记录left 前驱 和 right 后驱
    // 2、反转left
    // 3、前驱.next = 链表尾巴   链表头部.next = right后区
    
    /*
       1 2 3 4 5
    -1 1 2 3 4 5
    
    四个点
    start_befor  start   end  end_next
    1、反转 start end  (传入start 让end.next = nil) 就可以反转这个区域
    2、拼接   startbefor.next = end   start.next = end.next
    */

    func reverseBetween3(_ head: ListNode?, _ left: Int, _ right: Int) -> ListNode? {
           var dumpty:ListNode? = ListNode(-1)
           dumpty?.next = head
       
           var start_befor = dumpty
           for i in 0..<left-1 {
               start_befor = start_befor?.next
           }
           
           var start = start_befor?.next
           
           
           var end = dumpty
           // 找到反转区间的最后
           for i in 0..<right{
               print("end=\(end!.val)")
               end = end?.next
           }
           // 记录后区
           var end_next = end?.next

       
           // 反转 [subbegin end]
           end?.next = nil
           reverse(start)
           
           // 链表头部指向 尾巴的下一个
           start_befor?.next = end

           start?.next = end_next
           
           return dumpty?.next
       }

       func reverse(_ head: ListNode?) {
           var cur = head
           var pre:ListNode?
           while cur != nil {
               var temp = cur?.next
               cur?.next = pre
               pre = cur
               cur = temp
           }
       }
}
