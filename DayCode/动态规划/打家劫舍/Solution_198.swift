//
//  Solution_198.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/26.
//

import Foundation

class Solution_198 {
    // 每个放假都有 选择  偷或者不偷   影响最终的选择
    // dp[i] 代表 当来到num[i]房间时候 偷取的最大价值
    // 目标 来到 nums[n-1] 时候 最大的偷取价值  dp[n - 1]
    func rob(_ nums: [Int]) -> Int {
        let n = nums.count
        var dp = [Int](repeating: 0, count: n)
        dp[0] = nums[0]
        if nums.count == 1 {
            return dp[0]
        }
        dp[1] = max(dp[0], nums[1])
        
        for i in 2..<n {
            dp[i] = max(dp[i - 1], nums[i] + dp[i - 2])
        }
        return dp[n - 1]
    }
}
