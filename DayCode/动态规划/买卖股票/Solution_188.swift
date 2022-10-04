//
//  Solution_188.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/26.
//

/*
 
 考察点：  股票通用方程 三维dp k为1
 一次交易由买入和卖出构成，至少需要两天，所以说有效的限制 k 应该不超过 n/2，如果超过，就没有约束作用了，相当于 k = +infinity 
 */
class Solution_188 {
    func maxProfit(_ k: Int, _ prices: [Int]) -> Int {
        var max_k = k
        let n = prices.count
        guard k > 0, prices.count > 0 else {
            return 0
        }
        
        // 如果k超过一半，等于没有限制
        if max_k > n/2 {
            // 复用之前交易次数 k 没有限制的情况
            return maxProfit_k_inf(prices)
        }
        return maxProfit_k(prices, k)
    }
    
    // k 无限制
    func maxProfit_k_inf(_ prices: [Int]) -> Int {
        let n = prices.count
        
        var prices = prices
        
        // 定义二维
        var dp = [[Int]](repeating: [Int](repeating: 0, count: 2), count: prices.count)
        
        
        for i in 0..<n {
            if i - 1 == -1 {
                dp[i][0] = 0
                dp[i][1] = -prices[i]
                continue
            }
            dp[i][0] = max(dp[i-1][0], dp[i-1][1] + prices[i])
            dp[i][1] = max(dp[i-1][1], dp[i-1][0] - prices[i])
        }
        
        return dp[n-1][0]
    }
    
    // 做多k次
    func maxProfit_k(_ prices: [Int], _ k: Int) -> Int {
         let n = prices.count
         var prices = prices
         var max_k = k
         var dp2 = [Int](repeating: 0, count: 2)
         var dp1 = [[Int]](repeating: dp2, count: max_k + 1)
         var dp = [[[Int]]](repeating: dp1, count: prices.count)

         // k = 0 basecase
         for i in 0..<n {
             dp[i][0][1] = Int.min
             dp[i][0][0] = 0
         }

         for i in 0..<n {
             for k in (1...max_k).reversed() {
                 if i - 1 == -1 {
                     dp[i][k][0] = 0
                     dp[i][k][1] = -prices[i]
                     continue
                 }

                 dp[i][k][0] = max(dp[i - 1][k][0], dp[i - 1][k][1] + prices[i])
                 dp[i][k][1] = max(dp[i - 1][k][1], dp[i - 1][k - 1][0] - prices[i])
             }
         }

         return dp[n-1][max_k][0]
     }
}
