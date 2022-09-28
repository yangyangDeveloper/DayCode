//
//  Solution_69.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/28.
//

// 69. x 的平方根
class Solution_69 {
    // 二分查找
    func mySqrt(_ x: Int) -> Int {
        if x < 2 {
            return x
        }

        var left = 1
        var right = x

        while left <= right {
            let mid = left + (right - left) / 2
            // 用 x/mid 防止益处
            if x/mid == mid {
                return mid
            } else if x/mid < mid {
                right = mid - 1
            } else if x/mid > mid {
                left = mid + 1
            }
        }
        // 注意这个位置
        return right
    }
    
    // 全部来一遍
    func mySqrt2(_ x: Int) -> Int {
        
        if x <= 1 {
            return x
        }
        
        var res = 0
        for i in 1...x {
            var j = i * i
            if j <= x {
                res = i
            }else {
                break
            }
        }
        return res
    }
}
