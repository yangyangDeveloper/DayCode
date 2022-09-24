//
//  Solution_931.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/23.
//

// 931. 下降路径最小和
class Solution_931 {

    // dp[i][j] = min(dp[i - 1][j] ,dp[i - 1][j - 1], dp[i - 1][j + 1])
    /*
        if 最左边  min(上 右上)
        if 最右边  min(上，左上)
        if 中间   min(上，左上，右上)
    */
     
    func minFallingPathSum(_ matrix: [[Int]]) -> Int {
        
        var m = matrix.count
        var n = matrix[0].count
        var dp1 = [Int](repeating: 0, count:n)
        var dp = [[Int]](repeating: dp1, count: m)

        // base case
        // 起点
        for j in 0..<n {
            dp[0][j] = matrix[0][j]
        }

        // dp方程
        for i in 1..<m {
            for j in 0..<n {
                // 从最左边下落 最右边下落
                if j < 1 {  // 就 == 0  左边界  只有从上和上右下来
                   dp[i][j] = min(dp[i - 1][j], dp[i - 1][j + 1]) + matrix[i][j]
                }
                else if j >= n - 1  { // j = n - 1 右边界  只能从上和左上下来
                   dp[i][j] = min(dp[i - 1][j], dp[i - 1][j - 1]) + matrix[i][j]
                }
                else {  // 可以从上 左上 右上 3个方向下来
                    let t = min(dp[i - 1][j], dp[i - 1][j - 1])
                    dp[i][j] = min(t, dp[i - 1][j + 1]) + matrix[i][j]
                }
            }
        }

        // 可能掉落最后一行的任何位置  找到 最后一列的最小值
        var res = Int.max
        for j in 0..<n {
            res = min(res, dp[m-1][j])
        }
        return res
    }
}
