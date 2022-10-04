//
//  Solution_121.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/15.
//


/*
    考察点： 股票通用方程 三维dp k为1 

    dp[i][k][0 or 1]
    0 <= i <= n - 1, 1 <= k <= K
    n 为天数，大 K 为交易数的上限，0 和 1 代表是否持有股票。

    dp[i][k][0] = max(dp[i-1][k][0], dp[i-1][k][1] + prices[i])
         max( 今天选择 rest,        今天选择 sell )


    dp[i][k][1] = max(dp[i-1][k][1], dp[i-1][k-1][0] - prices[i])
         max( 今天选择 rest,         今天选择 buy )

    通用 base case：
    dp[-1][...][0] = dp[...][0][0] = 0
    dp[-1][...][1] = dp[...][0][1] = -infinity


     如果k = 1
 
     dp[i][1][0]  = max(dp[i - 1][1][0], dp[i- 1][1][1] + price[i])
     dp[i][1][1] = max(dp[i-1][1][1], dp[i-1][0][0] - price[i])
     状态转移方程：
     dp[i][0] = max(dp[i-1][0], dp[i-1][1] + prices[i])
     dp[i][1] = max(dp[i-1][1], -prices[i])

     base case：
     dp[i][0] = 0;
     dp[i][1] = -prices[i]


    返回值
    return dp[n-1][k][0]
    
*/

// 121. 买卖股票的最佳时机
class Solution_121 {
    
    func maxProfit3(_ prices: [Int]) -> Int {
        var n = prices.count
        var prices = prices
        // 定义二维
        var dp = [[Int]](repeating: [Int](repeating: 0, count: 2), count: prices.count)
                       
        for i in 0..<prices.count {
            if i - 1 == -1 {
                dp[i][0] = 0
                dp[i][1] = -prices[i]
                continue
            }
            dp[i][0]  = max(dp[i - 1][0], dp[i - 1][1] + prices[i])
            dp[i][1] = max(dp[i-1][1], -prices[i])
            
        }
        return dp[n-1][0]
    }
    
    
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
    
    
    /*
       状态定义 + 状态方程
       0 未持有
       前面就未持有
       前面持有 今天卖了  卖的收入的钱肯定要加上
       dp[i][0] = max(dp[i - 1][0], dp[i - 1][1] + price[i])
       

       1 持有
       前面就已经持有
       前面处于冷冻期 今天持有  花钱了 就扣除
       dp[i][1] = max(dp[i - 1][1], dp[i - 1][2] - price[i])
       

       2 冷冻期
       当天是冷冻期 就是前面1天已经未持有了
       dp[i][2] = dp[i - 1][0]

       初始化
       第一天持有股票利润肯定是 dp[0][1] = -prices[0];
       */

       /*
           一个坑：
       
           题目冷冻期的定义：卖出股票后，你无法在第二天买入股票 (即冷冻期为 1 天)。
           只有卖出股票之后 才有这个冷冻期
           买入+卖出 构成一笔交易    冷冻期是 每笔交易之间
           买入 卖出  冷冻期  开始第二笔买入

           题上说的冷冻期 和现实中的封闭期搞混了
           封闭期是 今天买入 今天不能卖  明天以后可以卖
       */

       func maxProfit2(_ prices: [Int]) -> Int {
           var dp1 = [Int](repeating: 0, count: 3)
           var dp = [[Int]](repeating: dp1, count: prices.count)
           
           dp[0][1] = -prices[0]

           for i in 1 ..< prices.count {
               dp[i][0] = max(dp[i - 1][0], dp[i - 1][1] + prices[i])
               dp[i][1] = max(dp[i - 1][1], dp[i - 1][2] - prices[i])
               // 处于冷冻期 肯定是卖出了    买入 卖出  冷冻期  买入        不是 买入 冷冻期 卖出
               dp[i][2] = dp[i - 1][0]
           }
           return dp[prices.count - 1][0]
       }
    
    
}
