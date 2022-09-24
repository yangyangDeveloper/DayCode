//
//  Solution_674.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/24.
//


// 674. 最长连续递增序列
class Solution_674 {
    /* dp[i] 以下标i为结尾的数组的连续递增的子序列长度为dp[i]
     
     basecese
     dp 初始化为1  因为一个数自己也是一个递增序列
     数组大小为 m + 1

     数学归纳法  加入dp[i] - 1 已经找到了结果  这里 if nums[i] > nums[i - 1] 表示为递增 所以在 + 1就行了

     递增连续子序列
     for i in 0..<m {
         if nums[i + 1] > nums[i] { // 连续记录
            dp[i + 1] = dp[i] + 1
         }
         res = max(res, dp[i])
     }

     如果是递增子序列 默认是不连续的
     var res = 0
     for i in 1...m {
         for j in 1..<i {
             if nums[i - 1] > nums[j - 1] {
                 dp[i] = max(dp[i], dp[j] + 1)
             }
             res = max(res, dp[i])
         }
     }
    */

    func findLengthOfLCIS(_ nums: [Int]) -> Int {
        if nums.count == 0 || nums.count == 1 {
            return nums.count
        }

         var dp = [Int](repeating:1, count:nums.count)
         var res = 0
         for i in 0..<nums.count - 1 {
            if nums[i + 1] > nums[i] { // 连续记录
                dp[i + 1] = dp[i] + 1
            }
            res = max(res, dp[i + 1])
         }
         return res
    }
}
