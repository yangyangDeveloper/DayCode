//
//  Solution_5.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/19.
//

/*
     考察点：
     双指针在数组中的玩法
     双指针中的左右指针 -> 回文串的判断

     左右指针考点：
     1、 二分查找
     2、 两数之和
     3、 反转数组
     前3个是从左右往中心走  回文是从中心往两边走
     4、 是否为回文串的判断：
     5、 最长回文串： 从中心向两端扩散的双指针技巧
 
*/

// 5. 最长回文子串
class Solution_5 {
    
    var res = String()
    func longestPalindrome(_ s: String) -> String {
        
        var s = s.map({String($0)}) // 字符串转string数组
        

        for i in 0..<s.count {
            
            // 找到以 s[i] 为中心的回文串
            let s1 = findLongestPalindrome(s, i, i)
            // 找到以 s[i] 和 s[i+1] 为中心的回文串
            let s2 = findLongestPalindrome(s, i, i + 1)
            
            // 更新答案
            res = res.count > s1.count ? res : s1
            res = res.count > s2.count ? res : s2
        }
        
        return res
    }
    
    // 最长回文串
    func findLongestPalindrome(_ s: [String], _ left: Int, _ right: Int) ->String {
        var left = left
        var right = right
        while left >= 0 && right < s.count {
            if s[left] == s[right] {
                left -= 1
                right += 1
            }
        }
        
        print("left=\(left), right =\(right)")
        
        var str = s[left + 1 ... right].joined()
        print(str)
        return str
    }
}
