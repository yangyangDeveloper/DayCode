//
//  Solution_64.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/24.
//

/*
   考察点： 路径和
   路径和的题目 非常基础  给走出了行走的方向 和最终的落脚点
   是我们后序做数组 字符串 子序列专题的基础
 
    
   base case 一般都是 先把边界给处理了  如果是往右下走 那么r0和c0就是边界
   如果是从上往下掉落 那么第一列和最后一列就是边界
   如果是最长回文子序列 那就是 右上角是边界

*/

// 64. 最小路径和
class Solution_64 {
    // dp定义  dp[i][j] 代表从grid【0，0】 行进到 grid[i][j]的数字总和
    // 我们要求的事 dp[n-1, m-1]
    func minPathSum(_ grid: [[Int]]) -> Int {
        let m = grid.count
        let n = grid[0].count
        var dp1 = [Int](repeating: 0, count: n )
        var dp = [[Int]](repeating: dp1, count: m )

        // base case
        dp[0][0] = grid[0][0]
        // 第一列
        for i in 1..<m {
            dp[i][0] = dp[i - 1][0] + grid[i][0]
        }

        // 第一行
        for j in 1..<n {
            dp[0][j] = dp[0][j-1] + grid[0][j]
        }

        // dp状态转移
        for i in 1..<m {
            for j in 1..<n {
                dp[i][j] = min(dp[i-1][j], dp[i][j-1]) + grid[i][j]
            }
        }

        return dp[m-1][n-1]
    }
}
