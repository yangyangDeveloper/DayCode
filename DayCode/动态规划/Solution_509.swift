//
//  Solution_509.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/23.
//

/*
    动态规划入门题
    思路： 题目直接给出了转移方程  f(n)=f(n-1)+f(n-2)
    不要瞧不起这个方程，很多题目我们连这个方程都没有
    
    这个解法里面 有很多重复操作计算
    比如 算 20  需要19 18  算19 需要 18 17  等于 18被算了2遍  我们可以用一个备忘录+递归解决
 
 */

// 509. 斐波那契数
class Solution_509 {
    
    // 原始暴力解法
    func fib(_ n: Int) -> Int {
        if n == 0 || n == 1 {
            return n
        }
        return fib(n - 1) + fib(n - 2)
    }
    
    // 带备忘录的递归
    func fib2(_ n: Int) -> Int {
        var memo = [Int](repeating:0, count: n + 1)
        return helper(&memo, n)
    }

    // 递归穷举所有状态  + 备忘录
    func helper(_ memo: inout [Int], _ n: Int) -> Int {
        if n == 0 || n == 1 {
            return n
        }
        if memo[n] != 0 {
            return memo[n]
        }
        memo[n] = helper(&memo, n - 1) + helper(&memo, n - 2)
        return memo[n]
    }
    
    
    // dp数组解法
    func fib3(_ n: Int) -> Int {
        if n == 0 || n == 1 {  return n }
        var dp = [Int](repeating:0, count: n + 1)
        dp[0] = 0
        dp[1] = 1
        for i in 2...n {
            dp[i] = dp[i - 1] + dp[i - 2]
            //dp[i] = (dp[i - 1] + dp[i - 2]) % 1000000007
        }
        return dp[n]
    }
}
