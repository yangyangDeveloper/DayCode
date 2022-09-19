//
//  Solution_344.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/19.
//

import Foundation

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
