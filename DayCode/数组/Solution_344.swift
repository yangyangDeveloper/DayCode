//
//  Solution_344.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/19.
//

import Foundation

/*
     考察点：
     双指针在数组中的玩法
     双指针中的左右指针 -> 反转数组

     左右指针考点：
     1、 二分查找
     2、 两数之和
     3、 反转数组
     前3个是从左右往中心走  回文是从中心往两边走
     4、 是否为回文串的判断：
     5、 最长回文串： 从中心向两端扩散的双指针技巧
 
*/

// 反转字符串数组
class Solution_344 {
    func reverseString(_ s: inout [Character]) {
        var left = 0
        var right = s.count - 1
        
        while left < right {
            var temp = s[left]
            s[left] = s[right]
            s[right] = temp
            left += 1
            right -= 1
        }
    }
}
