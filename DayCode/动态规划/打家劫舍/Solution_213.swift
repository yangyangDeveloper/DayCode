//
//  Solution_213.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/26.
//


/*
   考察点： 环形数组 拆分为
   1、 0到n-1
   2、 1到n
   3、 1到n-1 在第一和第二种情况里
   max(0 到n - 1)   和 max （1 到 n）
   最后在max 一些就行了
 */
// 213. 打家劫舍 II
class Solution_213 {
    
    func rob(_ nums: [Int]) -> Int {
         var nums = nums
         if nums.count == 0 {
             return 0
         }
         if nums.count == 1 {
             return nums[0]
         }
         
         let count = nums.count
         let m1 = Array(nums[0...count-2])
         let m2 = Array(nums[1...count-1])
         return max(helper(m1), helper(m2))
     }

     func helper(_ nums: [Int])-> Int {
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
             dp[i] = max(dp[i - 1], dp[i - 2] + nums[i])
         }
         // 肯定是偷一遍就知道答案了
         return dp[n-1]
     }
}
