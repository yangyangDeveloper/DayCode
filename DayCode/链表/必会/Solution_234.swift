//
//  Solution_234.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/8/26.
//

/*
     考察点： 链表是否是回文链表  可以把链表放到数组种 或者利用系统的递归栈  然后 left right 比较
     1、判断是否是回文字符串      left right 搞起来
     2、查找字符串中的回文子串    中心扩展查找
    
     直接left right 指针判断  但是链表的话 没办法直接访问最后
     最容易想到的是 放到一个 数组里面  然后从数组 左右边界对比
     time o(n)  spaceo(n)
 
     思路二： 用后序递归对比  借助递归提供的栈
*/

// 234. 回文链表
class Solution_234 {
    
    var left: ListNode?
    func isPalindrome4(_ head: ListNode?) -> Bool {
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
    
    func isPalindrome(_ head: ListNode?) -> Bool {
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
                
        var times = res.count / 2
    
        for i in 0..<times {
            var j = res.count - 1 - i
            if res[i] != res[j] {
                return false
            }
        }
        
        return true
    }
    
    func isPalindrome3(_ head: ListNode?) -> Bool {
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
}
