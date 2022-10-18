//
//  Solution_148.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/8/31.
//

// 148. 排序链表
class Solution_148 {
    /*
        1、双指针找到中心点
        2、归并排序 合并两个有序俩表
    */
    func sortList(_ head: ListNode?) -> ListNode? {
         if (head == nil || head?.next == nil) {
             return head
         }
         var slow = head
         // fast这么定义的话 最后slow是在偶数链表的左边
         var fast = head?.next
         // var fast = head 这么定义的话 slow是在偶数链表的右边

         // 快慢指针法，使得slow指向链表的中间节点。
         while(fast != nil && fast?.next != nil){
             slow = slow?.next
             fast = fast?.next?.next
         }
       
         // 切断俩表 分成2个 相比数组多了这一步
         let temp = slow?.next // 先记录位置在断开
         slow?.next = nil

         let left = sortList(head)
         let right = sortList(temp)
         let res = mergeTwoList(left,right)
         return res;
     }

     func mergeTwoList(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
          var dumpty:ListNode? = ListNode(-1)
          var temp = dumpty
          var p1 = list1
          var p2 = list2
          while p1 != nil && p2 != nil {
              if p1!.val < p2!.val {
                  temp?.next = p1
                  temp = temp?.next
                  p1 = p1?.next
              }else {
                  temp?.next = p2
                  temp = temp?.next
                  p2 = p2?.next
              }
          }

          if p1 != nil {
              temp?.next = p1
          }

          if p2 != nil {
              temp?.next = p2
          }

          return dumpty?.next
     }
    
}


