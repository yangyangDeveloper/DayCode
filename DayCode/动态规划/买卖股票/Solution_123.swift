//
//  Solution_123.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/26.
//

/*
 
 考察点：  股票通用方程 三维dp k最多为2
 思考：
 1、状态变化 有k  所以循环需要加上 k的列表
 2、k为0的  base case
 3、return dp[n-1][max_k][0]
 */

// 123. 买卖股票的最佳时机 III
class Solution_123 {

    func maxProfit(_ prices: [Int]) -> Int {
        
        let n = prices.count
        var prices = prices
        var max_k = 2
        var dp2 = [Int](repeating: 0, count: 2)
        var dp1 = [[Int]](repeating: dp2, count: max_k + 1)
        var dp = [[[Int]]](repeating: dp1, count: prices.count)
        
        // k = 0 时的 base case
        for i in 0..<n {
            dp[i][0][1] = Int.min
            dp[i][0][0] = 0
        }
        
        for i in 0..<n {
            // 加上k的情况
            for k in (1...max_k).reversed() {
                if i - 1 == -1 {
                    dp[i][k][0] = 0
                    dp[i][k][1] = -prices[i]
                    continue
                }
                dp[i][k][0]  = max(dp[i-1][k][0], dp[i-1][k][1] + prices[i])
                dp[i][k][1] = max(dp[i-1][k][1], dp[i-1][k-1][0] - prices[i])
            }
        }
        // 穷举了 n × max_k × 2 个状态，正确。
        return dp[n-1][max_k][0]
    }
}
