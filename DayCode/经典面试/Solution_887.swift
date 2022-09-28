//
//  Solution_887.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/28.
//

// 887. 鸡蛋掉落
class Solution_887 {

/*
    简介
    什么叫最坏的情况： 比如7层楼   可能最坏的情况是在7层破摔
    就一个鸡蛋 k= 1： 一个鸡蛋必须稳妥的从最低层开始，并且做好鸡蛋在n层才会破碎的最坏打算  所以我们要线性扫描  需要 7次
    鸡蛋无穷个： 二分查找  log(2, n)向上取整次就可以找到
    楼层n= 0 ： 鸡蛋本身就在地上不会烂 无需验证底层会破碎
*/

    
    /*
        推理：
        dp(k,n) 鸡蛋为k  楼层为n   相当于二元函数
        假设x层扔下去 必然2个结果：
        1、鸡蛋破裂 还有鸡蛋 k-1个 研究搜索楼层 从1到x-1 一共x-1这些楼层  这种状态下 最少需要 dp(k-1, x-1)次测试
        2、鸡蛋没碎，还有k个鸡蛋， 我们在研究搜索的头层 从x+1 到n-x个楼层  这种状态下 最少需要 dp(k, n- x)次测试
        因为我们考虑的是最坏情况 所以最坏就是指尝试的次数最多 因此在以上两个结果中 需要找到最大的值

        dp(k-n) = max(dp(k-1, x-1), dp(k, n- x)) + 1

        x怎么选择呢  最简单的方法从1到n遍历一遍   从中选择可以使 max(dp(k-1, x-1), dp(k, n- x)) + 1  最小的x的情况

        base case
        k = 1  return n
        n == 0 return 0

    */


    /*
         定义： dp[i][k]表示有k个鸡蛋，i层楼中确定F的具体值的最小搜索次数
         状态方程： 在j层尝试   dp[i][k] = min(max(dp[j-1][k-1], dp[i-j][k])) + 1
         // base case
         dp[i][1] = i

         否者k= 2 开始

         // 状态
         for i in 1...n {
             for k in 2...k {
                 var res = max
                 for j in 1..i {  // 选择
                     res = min(max(dp[j-1][k-1], dp[i-j][k])) + 1
                 }
                 dp[i][k] = res
             }
         }
         dp[n][k]
         

    */


    func superEggDrop(_ k: Int, _ n: Int) -> Int {
        var t = k
        var dp1 = [Int](repeating:0, count: k + 1)
        var dp = [[Int]](repeating: dp1, count: n + 1)
        
        // 就一个鸡蛋
        if k == 1 {
            return n
        }
        
        // 就一个鸡蛋
        for i in 0...n {
            dp[i][1] = i
        }

        for i in 1...n {
            for k in k...t {
                var res = Int.max
                for j in 1...i {
                     let t = max(dp[j - 1][k - 1], dp[i - j][k]) + 1
                     res = min(res, t)
                }
               dp[i][k] = res
            }
        }
        return dp[n][k]
    }
    
    /*
     
      备忘录解法
     
    */
    // 定义：手握 K 个鸡蛋，面对 N 层楼，最少的扔鸡蛋次数为 dp(K, N)
    var memo = [[Int]]()
    func superEggDrop2(_ k: Int, _ n: Int) -> Int {
        var dp1 = [Int](repeating:-666, count: k + 1)
        memo = [[Int]](repeating: dp1, count: n + 1)
        return dp(k,n)
    }
    
    func dp(_ k: Int, _ n: Int) -> Int {
        // base case
        if k == 1 {
            return n
        }
        
        if n == 0 {
           return 0
        }
        if memo[n][k] != -666 {
           return memo[n][k]
        }
        
        var  res = Int.max
        for i in 1...n {
            // 最坏情况下的最少扔鸡蛋次数
            res = min(res, max(dp(k - 1, i - 1), dp(k, n - i)) + 1)
            
        }
        memo[n][k] = res
        return res
    }
    
    // 二分优化
    func dp2(_ k: Int, _ n: Int) -> Int {
        // base case
        if k == 1 {
            return n
        }
        
        if n == 0 {
           return 0
        }
        if memo[n][k] != -666 {
           return memo[n][k]
        }
        
        var res = Int.max
        
        var left = 1
        var right = n
        while left <= right {
            var mid = left + (right - left) / 2
            
            // no1 碎了  no2 没碎
            var no1 = dp2(k - 1, mid - 1)
            var no2 = dp2(k, n - mid)
            
            if no1 > no2 {
                right = mid - 1
                res = min(res, no1 + 1)
            } else {
                left = mid + 1
                res = min(res, no2 + 1)
            }
        }
//        for i in 1...n {
//            // 最坏情况下的最少扔鸡蛋次数
//            res = min(res, max(dp(k - 1, i - 1), dp(k, n - i)) + 1)
//            
//        }
        memo[n][k] = res
        return res
    }
    
}
