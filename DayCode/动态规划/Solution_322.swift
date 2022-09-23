//
//  Solution_322.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/14.
//

/*
 
   考察点： 动态规划
   思考： 可以从顶往下 递归  也可以直接for循环从下往上推 + dp数组
 */

// 322. 零钱兑换
class Solution_322 {
    
    // 使用dp
    func coinChange3(_ coins: [Int], _ amount: Int) -> Int {
        var dp = [Int](repeating: amount + 1, count: amount + 1)
        
        dp[0] = 0
        
        // 遍历所有状态： 就是 dp[amout]代表凑够amout需要的硬币数
        for i in 0 ..< dp.count {
            // 做出选择 什么是选择： 就是我最终导致状态变化的就是选择
            for c in coins {
                if i - c < 0 {
                    continue
                }
                dp[i] = min(dp[i], 1 + dp[i - c])
            }
        }
        
        return (dp[amount] == amount + 1 ) ? -1 : dp[amount]
    }
    
    
    // 备忘录版本 自顶往下
    // 搞一个hash表进行存储
    var memo = [Int]()
    func coinChange2(_ coins: [Int], _ amount: Int) -> Int {
        memo = [Int](repeating: -66, count: amount + 1)
        return dp(coins, amount)
    }
    
    // 凑出总金额amount 最少需要 coinchang(c[1,2,5], amount)枚硬币
    func dp(_ coins: [Int], _ amount: Int) -> Int {
        
        // base case
        if amount == 0 { return 0 }
        // 在减的过程中 可能为负数
        if amount < 0 { return -1 }
        
        
        // 从备忘录取出来
        if memo[amount] != -66 {
            return memo[amount]
        }
        
        // 计算子问题的结果
        var res = Int.max
        for co in coins {
            var subp = dp(coins, amount - co)
            if subp == -1 { continue }
            // subp 的个数  +  1
            // 分解成子问题 +1
            res = min(res, subp + 1)
        }
        // 存入备忘录
        memo[amount] = res == Int.max ? -1 : res
        return memo[amount]
    }
    

}
