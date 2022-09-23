//
//  Solution_300.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/23.
//


/*
 考察点： 经典的dp题目
 */

// 300. 最长递增子序列

class Solution_300 {
    
    // 定义状态 dp[i] 就是以nums[i]为结尾的递增子序列的长度
    // 所有的状态列表 就是[1 nums]
    // 做出的选择  if 怒骂【j】 < nums [i] 就是符合条件的
    // dp[i] = max(dp[i], dp[j - 1] + 1)
    
    func lengthOfLIS(_ nums: [Int]) -> Int {
        if nums.count == 0 || nums.count == 1 {
            return nums.count
        }
        
        var res = Int.min
        // 初始化为1 以nums[i] 结尾的最长递增子序列起码要包含它自己
        var dp = [Int](repeating: 1, count: nums.count + 1)
        
        for i in 1..<nums.count {
            for j in 0..<i {
                // 寻找 nums[0..j-1] 中比 nums[i] 小的元素
                if nums[j] < nums[i] {
                    //  把 nums[i] 接在后面，即可形成长度为 dp[j] + 1， 且以 nums[i] 为结尾的递增子序列
                    dp[i] = max(dp[i], dp[j] + 1)
                }
            }
        }
        
        for i in 0..<nums.count {
            res = max(res, dp[i])
        }
        
        return res
    }
}
