//
//  Solution_123.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/26.
//

import Foundation

class Solution_123 {
    /*
     
     1前面就不持有 dp[i-1][k][0]
     2昨天持有今天卖出  dp[i-1][k][1] + prices[i]
     dp[i][k][0]  = max(dp[i-1][k][0], dp[i-1][k][1] + prices[i])
     
     1、前面就持有 dp[i-1][k][1]
     2、昨天不持有哟今天买入  dp[i-1][k -1][0] - prices[i]
     dp[i][k][1] = max(dp[i-1][k][1], dp[i-1][k -1][0] - prices[i])
     
     
     // base case
      需要考虑 i
      需要考虑 k
     
      4个隐藏的boss
      dp[-1][k][0] = 0
      dp[-1][k][1] = min
      dp[i][0][0] = 0
      dp[i][0][1] = min
       
      4个初始化
      dp[0][k][0] = prices[i]
      
      
     */
    // 当k = 1 一次买卖就结束了
    // 当k不受限制  就是 k 和 k -1  都行
    // 当k = 2 时候 就需要穷举所有的k
    // 当k = 指定数字时候  如果k > n/2 就是不限制k
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
