//
//  Solution_234.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/8/26.
//

/*
     考察点： 双指针在链表中的技巧 -> 判断链表是否是回文链表
     思路：
     利用数组的思维 left right 相向而行对比
     但是链表的 right不能直接访问 我们可以想办法把链表节点放到数组中 或者利用系统的递归栈 进行对比
    
     相关提醒：
     1、判断是否是回文字符串
     2、查找字符串中的回文子串    中心扩展查找
*/

// 234. 回文链表
class Solution_234 {

    // MARK: -  后序遍历
    var left: ListNode?
    func isPalindrome(_ head: ListNode?) -> Bool {
        left = head
        return traver(head)
    }
    
    func traver(_ head: ListNode?) -> Bool {
        if head == nil {
            return true
        }
        var res = traver(head?.next)
        // 后序遍历代码
        res = res && (head?.val == left?.val)
        left = left?.next
        return res
    }
    
    
    // MARK: -  借助arr 比较
    func isPalindrome2(_ head: ListNode?) -> Bool {
        guard head != nil else {return false}
        var res = [Int]()
        var cur = head
        
        while cur != nil {
            res.append(cur!.val)
            cur = cur?.next
        }
        
        var left = 0
        var right = res.count - 1
        
       
        while left < right {
            if res[left] != res[right] {
                return false
            }
            left += 1
            right -= 1
        }
    
        return true
    }
    
    /*
        双指针 空间复杂度o(n)   时间复杂度 o(n)
        4个是 0 3  1 2 比2次            4/2
        3个是 0 2  比1次   所以比的次数是  3/2
        找到比较次数
     */
    func isPalindrome3(_ head: ListNode?) -> Bool {
        guard head != nil else {return false}
        var res = [Int]()
        var cur = head
        while cur != nil {
            res.append(cur!.val)
            cur = cur?.next
        }
        
        var left = 0
        var right = res.count - 1
                
        var times = res.count / 2
    
        for i in 0..<times {
            var j = res.count - 1 - i
            if res[i] != res[j] {
                return false
            }
        }
        
        return true
    }
    
    // MARK: -  借助stack
    func isPalindrome4(_ head: ListNode?) -> Bool {
        guard head != nil else { return false }
        var res = [ListNode]()
        var cur = head
        while cur != nil {
            res.append(cur!)
            cur = cur?.next
        }
        var left = head
        while left != nil {
            var temp = res.removeLast()
            if temp.val != left?.val {
                return false
            }
            left = left?.next
        }
        return true
    }
    
    
    // MARK: -  双指针
    func isPalindrome5(_ head: ListNode?) -> Bool {

         // 找中心
         var slow = head
         var fast = head
         while fast != nil && fast?.next != nil {
             fast = fast?.next?.next
             slow = slow?.next
         }

         if fast != nil {
             slow = slow?.next
         }

         var left = head
         var right = reverse(slow)

         // 前后指针
         while right != nil {
             if left!.val != right!.val {
                 return false
             }
             left = left?.next
             right = right?.next
         }
        return true
     }

     // 反转 [head, nil)
     func reverse(_ head: ListNode?) -> ListNode? {
         var pre: ListNode?
         var cur = head
         var net = head
         while cur != nil {
             net = cur?.next
             cur?.next = pre
             pre = cur
             cur = net
         }
         return pre
     }
}
