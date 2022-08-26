//
//  Solution_234.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/8/26.
//

// 回文链表
class Solution_234 {
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
