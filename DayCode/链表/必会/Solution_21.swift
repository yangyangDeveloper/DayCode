//
//  Soluton_21.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/8/2.
//

/*
    考察点： 双指针在链表中的技巧 -> 合并有个有序链表
     
    已经是分开的2个链表了，让我们合并单链表
    
    细节：
    1、 亚节点p
    2、 p1 和 p2 分别指向2个链表头部
    p1和p2较小的 优先接到p上
    
    模版
    while(p1 != nil  && p2!= nil) {
        //
    }
    if p1   != nil {
 
    }
    if p2 != nil {
  
    }
    
    相当于把2个链表拉在一起  那么如何把一个链表分隔成2个链表呢
 
 类似题目
    leetcode 86   分割链表
    leetcode 328  奇偶链表
    
*/

// 21. 合并两个有序链表
class Solution_21 {
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        
        guard list1 != nil || list2 != nil else {
            return  list1 == nil ?  list2 : list1
        }

        var dumpty = ListNode(-1)
        var temp = dumpty

        var t1 = list1
        var t2 = list2

        // 有一个为空就结束
        while t1 != nil  &&  t2 != nil {
            var temp1 = t1!.val
            var temp2 = t2!.val
            if temp1 < temp2 {
                temp.next = t1
                t1 = t1!.next
            } else {
                temp.next = t2
                t2 = t2!.next
            }
            temp = temp.next!
        }


        // 拼接
        if t1 != nil {
            temp.next = t1
        }
        if t2 != nil {
            temp.next = t2
        }

        return dumpty.next
    }
}
