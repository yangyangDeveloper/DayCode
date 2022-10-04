//
//  Solution_300.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/23.
//


/*
    考察点： LIS
    子序列默认不连续   子数组默认利连续
    
    dp[i] = max(dp[i], dp[j] + 1)
    数学归纳法 假设找5的时候 0到4都有结果了
 
    最长递增子序列
    最长连续递增子序列 ===  最长递增数组
    
*/

// 300. 最长递增子序列
class Solution_300 {
    
    // 定义状态 dp[i] 就是以nums[i]为结尾的递增子序列的长度
    func lengthOfLIS(_ nums: [Int]) -> Int {
        if nums.count == 0 || nums.count == 1 {
            return nums.count
        }
        
        // 初始化为1 以nums[i] 结尾的最长递增子序列起码要包含它自己
        var dp = [Int](repeating: 1, count: nums.count)
        
        // 数学归纳法 假设找5的时候 0到4都有结果了
        for i in 1..<nums.count {
            for j in 0..<i {
                // 寻找 nums[0..j-1] 中比 nums[i] 小的元素
                if nums[i] > nums[j] {
                    //  把 nums[i] 接在后面，即可形成长度为 dp[j] + 1， 且以 nums[i] 为结尾的递增子序列
                    dp[i] = max(dp[i], dp[j] + 1)
                }
            }
        }
        
        var res = Int.min
        for i in 0..<dp.count {
            res = max(res, dp[i])
        }
        return res
    }
}
