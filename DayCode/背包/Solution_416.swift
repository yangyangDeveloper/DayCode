//
//  Solution_416.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/16.
//

import Foundation

/*
         01背包问题
         widget
         包重量
         dp[i][j] 代表j的背包装到i物品 最大的价值
         
         if  不放物品i  装不进去背包了
         dp[i - 1] [j]

         if  放物品i 可以装进背包
         dp[i - 1][j - weight[i]]  + value[i]
        
         所以状态方程就是
         dp[i][j] = max(dp[i - 1][j],  dp[i - 1][j - widget(i)] + value(i))
         

         dp[i][0]  背包容量j为0的话 无论是选取哪些物品，背包价值总和一定为0
         dp[0][j]  i为0，存放编号0的物品的时候，各个容量的背包所能存放的最大价值
                 j < weight[0]  dp[0][j] = 0
                 j >= weight[0] dp[0][j] = value[0]

        for (int j = 0 ; j < weight[0]; j++) {  // 当然这一步，如果把dp数组预先初始化为0了，这一步就可以省略，但很多同学应该没有想清楚这一点。
             dp[0][j] = 0;
        }

        // 正序遍历
        for (int j = weight[0]; j <= bagweight; j++) {
            dp[0][j] = value[0];
        }
*/

/*
 
 当i件商品商品时候 重量为j
 dp[i][j] == true, i = 1, j = 1
 // 当1件商品 重量为2  有空
 dp[i][j] == false, i = 1, j = 2
 dp[i][j] == false, i = 1, j = 3
 根本装不进去dp[i][j] == true, i = 2, j = 1
 dp[i][j] == true, i = 2, j = 2
 dp[i][j] == true, i = 2, j = 3
 根本装不进去dp[i][j] == true, i = 3, j = 1
 根本装不进去dp[i][j] == true, i = 3, j = 2
 dp[i][j] == true, i = 3, j = 3
*/

class Solution_416 {
    
    // 给你一个背包重量为 和/2 的包 和 n件商品  每个商品重量为num[i] 让你装物品 是否能有一种装发 能够恰好将背包装满
    // 状态 背包容量  可选的商品
    // 选择 装进背包 和 不装进背包
    // dp[i][j] = x   i个商品 j为重量  对于前 i 个物品，当前背包的容量为 j 时，若 x 为 true，则说明可以恰好将背包装满，若 x 为 false，则说明不能恰好将背包装满
    // dp[i][j] = dp[i - 1][j]  dp[i][j] = dp[i - 1][j - nums[i - 1]]
    
    func canPartition(_ nums: [Int]) -> Bool {
        
        var nums = nums
        var sum = 0
        for item in nums {
            sum += item
        }
        
        if sum % 2 != 0 {
            return false
        }
        
        let n = nums.count
        sum = sum / 2
        // 转化为背包问题
        var dp1 = [Bool](repeating: false, count: sum + 1)
        var dp = [[Bool]](repeating: dp1, count: n + 1)
        
        for i in 0..<n {
            dp[i][0] = true
        }
        
        for i in 1...n {  // 商品
            for j in 1...sum { // 背包重量
                if j - nums[i - 1] < 0 {
                    // 过重装不进去
                    dp[i][j] = dp[i - 1][j]
                    //print(dp[i - 1][j])
                    print("根本装不进去dp[i][j] == \(dp[i][j]), i = \(i), j = \(j)")
                }else {
                    // i 从1开始  要减去偏移   装入或者不装入背包
                    dp[i][j] = dp[i - 1][j] || dp[i - 1][j - nums[i - 1]]
                    print("dp[i][j] == \(dp[i][j]), i = \(i), j = \(j)")
                }
            }
        }
        
        return dp[n][sum]
    }
}
