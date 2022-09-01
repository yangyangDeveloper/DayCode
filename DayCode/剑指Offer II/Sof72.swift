//
//  Sof72.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/1.
//

// 剑指 Offer II 072. 求平方根
class So72{
    // 二分查找
    // x的平方数的整数部分ans 是满足 k2<= x 的最大k 就是 ans  所以可以用二分
    // 假设左边是0  右边是x  通过mid找到 ans   然后在不断的移动mid  寻找最终的ans
    
    func mySqrt(_ x: Int) -> Int {
        var left = 0
        var right = x
        var ans = 0
        while left <= right {
            var mid = left + (right - left) / 2
            if mid * mid <= x {
                ans = mid
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        return ans
    }
}
