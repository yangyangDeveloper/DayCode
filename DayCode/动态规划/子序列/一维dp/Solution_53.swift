//
//  Solution_53.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/7/22.
//


/*
 考察点： 经典的dp题目
 解法：
 1、贪心 2种解法
 2、数组前缀和
 3、dp
 4、滑动窗口解法
 
 */

// 53. 最大子数组和
class Solution_53 {
    /*
     
       定义 dp[i] 代表以nums[i]结尾的最大子数组的和
       状态列表  【1.。。nums.count-1】
       方程 dp[i] = max(nums[i], dp[i - 1] + nums[i])
       最后for循环里面查找
     
     */
    func maxSubArray(_ nums: [Int]) -> Int {
        if nums.count == 0  {
            return 0
        }
        
        // 穷举所有
        var dp = [Int](repeating: 0, count: nums.count)
        // base case
        dp[0] = nums[0]
        
        // 状态转移方程

        for i in 1..<nums.count {
            dp[i] = max(nums[i], dp[i - 1] + nums[i])
        }
        
        // 取出最大值
        var res = Int.min
        for i in 0..<nums.count {
            res = max(res, dp[i])
        }
        return res
    }
    
    // 贪心算法1
    func maxSubArray2(_ nums: [Int]) -> Int {
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
    
    
    // 贪心算法2
    func maxSubArray3(_ nums: [Int]) -> Int {

        var res = Int.min
        var temp = 0

        for i in 0 ..< nums.count {
            temp += nums[i]
            if temp > res {
                res = temp
            }
            if temp < 0 {
                temp = 0
            }
        }
        return res
    }
    
    
    // 前缀和
    func maxSubArray4(_ nums: [Int]) -> Int {

        var res = Int.min
        var temp = 0

        for i in 0 ..< nums.count {
            temp += nums[i]
            if temp > res {
                res = temp
            }
            if temp < 0 {
                temp = 0
            }
        }
        return res
    }
    
    // 滚动窗口解法
    func maxSubArray5(_ nums: [Int]) -> Int {
        var maxSum = Int.min
        var curSum = 0
        var left = 0
        var right = 0
        while right < nums.count {
            var c = nums[right]
            right += 1
            curSum += c
            // 搜索左侧窗口
            while curSum < 0 {
                var d = nums[left]
                left += 1
                curSum -= d
            }
            
            maxSum = max(maxSum, curSum)
        }
    
        return maxSum
        
    }
}
