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


class Solution_416 {
    
    /*
        // 背包问题
         背包体积 sum/2
         背包要放入的物品 重量为元素值  价值可为元素值
         背包刚好装好 说明找到了总和 sum/2的子集
         背包里面的每一个元素不可以重复放入
     */
    
    /*
     //01背包
     for (int i = 0; i < n; i++) {
         for (int j = m; j >= V[i]; j--) {
             f[j] = max(f[j], f[j-V[i]] + W[i]);
         }
     }
     
     //完全背包
     for (int i = 0; i < n; i++) {
         for (int j = V[i]; j <= m; j++) {
             f[j] = max(f[j], f[j-V[i]] + W[i]);
         }
     }
     f[j]代表当前背包容量为j的时候，可以获取的最大价值。
     完全背包是从左向右遍历，f[j-V[i]]取到的是拿第i个物品时的值，是新值，可以重复无限的拿，f[j]的值也会随之增加。
     V：商品的体积
     W：商品的价值
     */
    func canPartition(_ nums: [Int]) -> Bool {
        var sum = 0  //nums.reduce(0, { $0 + $1 })
        for i in 0..<nums.count {
            let num = nums[i]
            sum += num
        }
        
        // 和为奇数时，不可能划分成两个和相等的集合
        if sum % 2 != 0 {
            return false
        }
        
        let count = nums.count
        sum = sum / 2
        
        
        // 方法二：一维数组dp
        var dp = [Bool](repeating: false, count: sum + 1)
        dp[0] = true
        
        for i in 0..<count {
            for j in (0..<dp.count).reversed() {
                if j - nums[i] >= 0 {
                    dp[j] = dp[j] || dp[j - nums[i]]
                }
            }
        }
        return dp[sum]
    }
}
