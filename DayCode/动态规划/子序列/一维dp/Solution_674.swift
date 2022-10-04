//
//  Solution_674.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/24.
//

/*
 
  考察点：最长连续子递增序列 === 最长连续数组
  数学归纳法 去思考 1纬dp
  假设前面的已经有结果了 在后面的某个位置去思考
 */
// 674. 最长连续递增序列
class Solution_674 {
    // dp[i] 以下标i为结尾的数组的连续递增的子序列长度为dp[i]
    func findLengthOfLCIS(_ nums: [Int]) -> Int {
        var dp = [Int](repeating: 1, count: nums.count)
        
        for i in 1..<nums.count {
            // 一个循环 保证连续递增
            if nums[i] > nums[i - 1] {
                dp[i] = dp[i - 1] + 1
            }
        }
        
        // 找最大值
        var res = Int.min
        for i in 0..<dp.count {
            res = max(res, dp[i])
        }
        return res
    }
}
