//
//  Solution_188.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/26.
//

import Foundation
class Solution_188 {
    
    // dp[i][k][持有不持有]
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
        
        
        var dp2 = [Int](repeating: 0, count: 2)
        var dp1 = [[Int]](repeating: dp2, count: max_k + 1)
        var dp = [[[Int]]](repeating: dp1, count: prices.count)
        

        // base case：
        // dp[-1][...][0] = dp[...][0][0] = 0
        // dp[-1][...][1] = dp[...][0][1] = -infinity
        // 如果默认值使用0，状态转移过程中会出现决策错误 所以这里做一下初始化
        for i in 0..<n {
            dp[i][0][0] =  0
            dp[i][0][1] = Int.min
        }
        
        for i in 0..<n {
            for k in (1...max_k).reversed() {
                if i - 1 == -1 {
                    // 处理 i = -1 时的 base case 是从上面推到出来的
                    dp[i][k][0] = 0
                    dp[i][k][1] = -prices[i]
                    continue
                }
                
                dp[i][k][0] = max(dp[i-1][k][0], dp[i - 1][k][1] + prices[i])
                dp[i][k][1] = max(dp[i-1][k][1], dp[i-1][k-1][0] - prices[i])
            }
        }
        
        return dp[n-1][max_k][0]
    }
    
    // 复用之前交易次数 k 没有限制的情况
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
}
