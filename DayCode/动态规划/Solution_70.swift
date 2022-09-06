//
//  Solution_70.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/4.
//

// 70. 爬楼梯
class Solution_70 {
    
    // 排序1
    func climbStairs(_ n: Int) -> Int {
        if n <= 1 {
            return n
        }
        var dp = [Int](repeating: Int.max, count: n+1)
        dp[1] = 1
        dp[2] = 2
        var i = 3
        while i <= n {
            dp[i] = dp[i - 1] + dp[i - 2]
            i += 1
        }
        dp.forEach { item in
            print(item)
        }
       
        return dp[n]
    }
    
    // 排序2
    func climbStairs2(_ n: Int) -> Int {
        if n <= 1 {
            return n
        }
        var dp = [Int](repeating: Int.max, count: n+1)
        dp[1] = 1
        dp[2] = 2
 
        for i in 3...n {
            dp[i] = dp[i - 1] + dp[i - 2]
        }
        
        return dp[n]
    }
    
}
