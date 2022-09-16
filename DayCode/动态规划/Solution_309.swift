//
//  Solution_309.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/16.
//

import Foundation

//
class Solution_309 {
    // 两种状态  0未持有  1持有
    func maxProfit(_ prices: [Int]) -> Int {
        var dp1 = [Int](repeating: 0, count: 2)
        var dp = [[Int]](repeating: dp1, count: prices.count + 1)
        dp[1][1] = -prices[0]
        for i in 1..<prices.count {
            // 冷冻期的理解
            // 我昨天买入今天是可以卖出的 不需要冷冻期的
            // 我昨天买日今天卖出然后明天还想继续买入 不行 必须进入冷冻期
            // 周一买入 周二卖出  完全ok
            // 周一买入 周二卖出  周三必须冷冻期 周四可以买入（可以买 可以不买 但是你有资格买了）
            
            // 未持有状态 可能是前面已经卖了  可能是持有到昨天 然后今天卖了
            dp[i + 1][0] = max(dp[i][0], dp[i][1] + prices[i])

            // 持有状态  可能是前面已经持有了  或者前面的前面一天持有 + 今天买入  (巧妙的绕过 冷冻期)
            dp[i + 1][1] = max(dp[i][1], dp[i - 1][0] - prices[i])
        }
        // 肯定是未持有状态的钱更多
        return dp[prices.count][0]
    }
}
