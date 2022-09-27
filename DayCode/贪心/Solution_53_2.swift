//
//  Solution_53.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/14.
//

// 53. 最大子数组和
class Solution_53_2 {
    func maxSubArray(_ nums: [Int]) -> Int {
        var res = Int.min
        var count = 0
        for i in 0..<nums.count {
            count = count + nums[i]
            if count > res {
                res = count
            }
            if count <= 0 {
                count = 0
            }
        }
        return res
    }
}
