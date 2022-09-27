//
//  Solution_198.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/26.
//

import Foundation

class Solution_198 {
    // dp[i] = x 表示：
    // 从第 i 间房子开始抢劫，最多能抢到的钱为 x
    func rob(_ nums: [Int]) -> Int {
        
        if nums.count == 0 {
            return 0
        }
        if nums.count == 1 {
            return nums[0]
        }
        let n = nums.count
        var dp = [Int](repeating: 0, count: n)
        dp[0] = nums[0]
        dp[1] = max(dp[0], nums[1])
        
        for i in 2..<n {
            dp[i] = max(dp[i - 1], nums[i] + dp[i - 2])
        }
        
        return dp[n - 1]
    }
}
