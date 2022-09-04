//
//  Solution_96.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/4.
//

// 96. 不同的二叉搜索树
class Solution_96 {
    func numTrees(_ n: Int) -> Int {
        if n <= 1 {
            return 1
        }
        
        var dp = [Int](repeating: 0, count: n + 1)
        dp[0] = 1
        dp[1] = 1
        
        for i in 2...n {
            for j in 1...i {
                dp[i] += dp[j - 1] * dp[i - j]
            }
        }
        return dp[n]
    }
}
