//
//  Solution_322.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/14.
//

import Foundation

// 322. 零钱兑换
class Solution_322 {
    // 备忘录版本  自顶往下
    var memo = [Int]()
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        memo = [Int](repeating: -66, count: amount + 1)
        return dp(coins, amount)
    }
    
    func dp(_ coins: [Int], _ amount: Int) -> Int {
        if amount == 0 {
            return 0
        }
        
        if amount < 0 {
            return -1
        }
        
        if memo[amount] != -66 {
            return memo[amount]
        }
        
        var res = Int.max
        
        for co in coins {
            var subp = dp(coins, amount - co)
            if subp == -1 {
                continue
            }
            // subp 的个数  +  1
            res = min(res, subp + 1)
        }
        
        memo[amount] = res == Int.max ? -1 : res
        return memo[amount]
    }
    
    
    func coinChange2(_ coins: [Int], _ amount: Int) -> Int {
        var dp = [Int](repeating: amount + 1, count: amount + 1)
        
        dp[0] = 0
        
        // 遍历所有状态
        for i in 0 ..< dp.count {
            // 遍历选择的最小值
            for c in coins {
                if i - c < 0 {
                    continue
                }
                dp[i] = min(dp[i], 1 + dp[i - c])
            }
        }
        
        return (dp[amount] == amount + 1 ) ? -1 : dp[amount]
    }
}
