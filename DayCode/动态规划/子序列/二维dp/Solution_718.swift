//
//  Solution_718.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/24.
//

/*
    考察点： dp 子数组
    子序列默认不连续，子数组默认连续
    子数组的dp方程 比较简单
 */

class Solution_718 {
    /*
       子序列默认不连续，子数组默认连续
       本题目是子数组 所以遇到相等的 就 dp 就行了
   
       dp定义  dp[i][j] 表示长度为i的nums1 长度为j的nums2  最长的子数组长度
       dp[i][j] ：以下标i - 1为结尾的A，和以下标j - 1为结尾的B，最长重复子数组长度为dp[i][j]。
       换句话就是说 长度为i的a  长度为j的b 最长重复子数组为dp[i][j]
       
       初始化： dp数组 m + 1 n + 1

       dp方程：
        // 如果是子数组
        if nums1[i - 1] == nums[j - 1] {
             dp[i][j] = 1 + dp[i-1][j-1]
        }
        // 如果是子序列
        if nums1[i - 1] == nums[j - 1] {
             dp[i][j] = 1 + dp[i-1][j-1]
        } else {
            dp[i][j] = max(dp[i - 1][j], dp[i][j - 1])
        }
        
        base case
        上边界 左边界为0  往右下角走

        遍历走向分析
        边界：1...m
        循环 正常顺序

        返回值
        return[m][n]
    */

    func findLength(_ nums1: [Int], _ nums2: [Int]) -> Int {
        var res = 0
        let m = nums1.count
        let n = nums2.count
        var dp = [[Int]](repeating: [Int](repeating: 0, count:n + 1), count:m + 1)

        // base case
        
        for i in 1...m {
            for j in 1...n {
                if nums1[i - 1] == nums2[j - 1] {
                    dp[i][j] = 1 + dp[i-1][j-1]
                }

                res = max(res, dp[i][j])
            }
        }

        return res
    }
}
