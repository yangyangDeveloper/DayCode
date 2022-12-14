//
//  Solution_142.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/8/25.
//


/*
    考察点： 双指针在链表中的技巧 -> 判断单链表是否有环的模版的升级版查找入环扣
    思路： 利用快慢指针
    1、第一次相遇 查找相遇点 确定有环
    2、新指针从head移动  fast指针继续移动 fast指针速度变成1步保持和新指针速度一致  两者同时行进 k - m  如果相遇了 就是入环点

    解法1: 双指针入环
    解法2: hash字典记录  判断contains
 */

// 142. 环形链表 II
class Solution_142 {

    func detectCycle2(_ head: ListNode?) -> ListNode? {
        guard head != nil  else { return nil }
        // 判断是否有换
        var slow = head
        var fast = head
        
        while fast != nil && fast?.next != nil {
            fast = fast?.next?.next
            slow = slow?.next
            if fast === slow {
                break
            }
        }
        
        // 说明没有环
        if fast == nil || fast?.next == nil {
            // fast遇到空指针说明无环
            return nil
        }
        
        // 有环
        var newslow = head
        // 快慢指针同步前进，相交点就是环起点
        while newslow !== fast {
            newslow = newslow?.next
            fast = fast?.next
        }
        
        return newslow
    }
    
    
    func detectCycle(_ head: ListNode?) -> ListNode? {
        guard head != nil  else { return nil }
        var mmp = [ListNode]()
        var cur = head
        while cur != nil {
            if mmp.contains(cur!) {
                return cur
            } else {
                mmp.append(cur!)
            }
            cur = cur?.next
        }
        return nil
    }
}
