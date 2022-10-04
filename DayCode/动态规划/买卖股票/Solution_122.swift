//
//  Solution_122.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/15.
//

/*
 
 考察点： 股票通用方程 三维dp  k无限制 
 
 通用base case
 // i 是 -1  k 是0
 dp[-1][..][0] = dp[..][0][0] = 0
 
 dp[-1][..][1] = dp[..][0][1] = 最小值
 
 
 特化到 k 无限制的情况，状态转移方程如下：
 
 dp[i][0] = max(dp[i-1][0], dp[i-1][1] + prices[i])
 dp[i][1] = max(dp[i-1][1], dp[i-1][0] - prices[i])
 
 */

class Solution_122 {
    
    //dp解法
    /*
       dp[i][0] 第1天的利润状态  0<=i<n
     
       不持有
       dp[i][0] = max(dp[i-1][0], dp[i-1][1] + price[i])
     
       持有
       dp[i][1] = max(dp[i-1][1], dp[i-1][0] - price[i])
     
       basecase
       //末尾是0 就是0  末尾是1 就是-price[i]
       dp[0][0] = 0
       dp[0][1] = -price[i]
     
     */
    func maxProfit2(_ prices: [Int]) -> Int {
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
            dp[i][0] = max(dp[i-1][0], dp[i-1][1] + prices[i])
            dp[i][1] = max(dp[i-1][1], dp[i-1][0] - prices[i])
        }
        
        return dp[n-1][0]
    }
    
    // 贪心算法
    // 只要今天比昨天大，就卖出
    func maxProfit(_ prices: [Int]) -> Int {
        if prices.count < 1 {
            return 0
        }
        var res = 0
        for i in 1..<prices.count {
            if prices[i] > prices[i - 1] {
                res += prices[i] - prices[i - 1]
            }
        }
        return res
    }
}
