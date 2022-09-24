//
//  So47.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/24.
//


// 剑指 Offer 47. 礼物的最大价值
class Solution_offer47 {
    // dp定义  dp[i][j] 代表从定点00 到i j 的最大数字和
    // base case 第一行 第一列
    // dp[i][j] = max(dp[i-1][j], dp[i][j-1]) + grid[i][j]
    // dp初始化 -1 dp[0][0] = grid[0][0]  1..<m  1..<n
    // 返回结果为 dp[m-1][n-1]
    func maxValue(_ grid: [[Int]]) -> Int {

        let m = grid.count
        let n = grid[0].count
        var dp = [[Int]](repeating: [Int](repeating: -1, count:n), count:m)
        
        // base case
        dp[0][0] = grid[0][0]

        for i in 1..<m {
            dp[i][0] = dp[i-1][0] + grid[i][0]
        }

        for j in 1..<n {
            dp[0][j] = dp[0][j-1] + grid[0][j]
        }

        // 穷举
        for i in 1..<m {
            for j in 1..<n {
                dp[i][j] = max(dp[i-1][j], dp[i][j-1]) + grid[i][j]
            }
        }
        return dp[m-1][n-1]
    }
}
