//
//  Solution_121.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/15.
//

import Foundation
class Solution_121 {
    /*
        1、定义状态
        dp[i][0]  代表第i天持有股票(不一定是在i天买入，可以在之前任何一天买)     用户手里还有的现金
        dp[i][1]  代表第i天不持有股票(我今天已经卖了股票，明天同样是不持有股票)   用户手里可以得到的现金
        2、方程
        dp[i][0] = max(dp[i -1][0], -price[i])   第i天买入 或者i-1已经买入
        dp[i][1] = max(dp[i- 1][1], dp[i - 1][0] + price(i)))  i - 1持有  i卖出  或者 i - 1已经卖出
        3、初始化
        dp[0][0] = -prince[0]
        dp[0][1] =  0

        4、安全边界
    */
    func maxProfit(_ prices: [Int]) -> Int {
        var arr = prices
        if arr.count <= 1 {
            return 0
        }
    
        // 定义二维
        var dp = [[Int]](repeating: [Int](repeating: 0, count: 2), count: arr.count)
        
        // 初始化
        dp[0][0] = -prices[0]
        dp[0][1] = 0

        // 怎么做到穷举： 迭代方式
        for i in 1..<arr.count {
            //  穷举的过程中怎么巧妙： 添加备忘录
            dp[i][0] = max(dp[i - 1][0], -prices[i])
            dp[i][1] = max(dp[i - 1][1], dp[i - 1][0] + prices[i])
        }

        // 卖出一定大于持有
        return dp[arr.count - 1][1]
    }
}
