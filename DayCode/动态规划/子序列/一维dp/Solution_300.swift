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
    
    
    
    /*
           子数组 默认连续  子序列 默认不连续
           dp[i]]  表示nums长度为i 的最长子序列长度  也就是nums[i - 1]

           初始化： dp = 1
           大小    m + 1
           方程：  使用归纳法思想： 加入前面4的长度结果已经算出来了 那么5的长度呢
           dp[5] 就是如果是递增 那就 dp[4] + 1
           递增就是 if nums[i - 1] > nums[j - 1]

           两层for循环 穷举了 一切不连续
           如果只留下第一层 那就是连续的子数组
       */
       func lengthOfLIS2(_ nums: [Int]) -> Int {
           if nums.count == 0 || nums.count == 1 {
               return nums.count
           }
           var res = 0
           // 数学归纳法 假设找5的时候 0到4都有结果了
           var dp = [Int](repeating: 1, count: nums.count + 1)
           for i in 1...nums.count {   // 找到5之前比5小的 所有子序列 找一个最大的 然后拼接上5 也就是+1
               for j in 1..<i {
                   if nums[i - 1] > nums[j - 1] {
                       dp[i] = max(dp[i], dp[j] + 1)
                   }
                   res = max(res, dp[i])
               }
           }
           return res
       }
}
