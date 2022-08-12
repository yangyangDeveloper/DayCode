//
//  Solution_53.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/7/22.
//

import Foundation

// 动态规划
// 53. 最大子数组和
class Solution_53 {
    func maxSubArray(_ nums: [Int]) -> Int {
        if nums.count == 0  {
            return 0
        }
        
        var res = 0, maxans = nums[0]
        for item in nums {
            res = max(res + item, item)
            maxans = max(maxans, res)
        }
        return maxans
    }
}
