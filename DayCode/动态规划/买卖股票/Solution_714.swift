//
//  Solution_714.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/26.
//

/*
   考察点：股票通用方程 三维dp  k无限制
   思考： 和122题一样 只需要减去手续费
   比 188 123 题 难度小 不需要考虑 k的影响
 */
class Solution_714 {
    
    func maxProfit(_ prices: [Int], _ fee: Int) -> Int {
        let n = prices.count
        
        let prices = prices
        
        // 定义二维
        var dp = [[Int]](repeating: [Int](repeating: 0, count: 2), count: prices.count)
        
        for i in 0..<n {
            if i - 1 == -1 {
                dp[i][0] = 0
                dp[i][1] = -prices[i]
                continue
            }
            // 不持有
            dp[i][0] = max(dp[i-1][0], dp[i-1][1] + prices[i] - fee)
            // 持有
            dp[i][1] = max(dp[i-1][1], dp[i-1][0] - prices[i])
        }
        
        return dp[n-1][0]
    }
}
