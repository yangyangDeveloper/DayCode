//
//  Solution_712.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/24.
//

/*
   考察点： dp lcs子序列问题
   思路： dp搞一个二维数组 basecase 就是初始化 第一列和第一行
   求最大值 就是 上和左取大的 + 当前值
   求最小值 就是 上和左取小的 + 当前值
*/

// 712. 两个字符串的最小ASCII删除和
class Solution_712 {
    
    // dp数组解法
    // dp[i][j] 代表 s1[i..] s2[i..]删除成相同的字符串 最小的ascii码之和
    func minimumDeleteSum2(_ s1: String, _ s2: String) -> Int {
        let s1 = Array(s1)
        let s2 = Array(s2)
        let m = s1.count
        let n = s2.count
        var dp = [[Int]](repeating: [Int](repeating: 0, count: n + 1), count: m + 1)
        
        // base case
        // 初始化二维数组的最一列
        // 全部删除 s1
        for i in 1...m {
            dp[i][0] =  dp[i - 1][0] + Int(s1[i-1].asciiValue!)
        }
        
        // 全部删除s2
        // 初始化二维数组的第一行
        for j in 1...n {
            dp[0][j] = dp[0][j - 1] + Int(s2[j-1].asciiValue!)
        }
        
        // dp方程
        for i in 0..<m {
            for j in 0..<n {
                if s1[i] == s2[j] {
                    // 相等就什么也不做  上和左 拿来
                    dp[i + 1][j + 1] = dp[i][j]
                }else {
                    // 拿来 上和左的 最小值
                    // s1的i位置元素或者s2j位置上元素不属于最短子序列  选择删除和更小的那个
                    // 删除s1的i 移动se的j
                    let t1 = Int(s1[i].asciiValue!) + dp[i][j+1]
                    
                    // 删除s2的j 移动s1的i
                    let t2 = Int(s2[j].asciiValue!) + dp[i+1][j]
                    
                    dp[i+1][j+1] = min(t1, t2)
                }
            }
        }
        return dp[m][n]
    }
    
    
    // 解法1 备忘录解法
    func minimumDeleteSum(_ s1: String, _ s2: String) -> Int {
        let s1 = Array(s1)
        let s2 = Array(s2)
        return dp(s1, 0, s2, 0)
    }
    
    // 1、dp函数 递归  + 备忘录
    // 2、要么就是dp数组 for循环穷举
    // s1[i..] s2[i..]删除成相同的字符串
    // dp[i][j] 最小的ascii码之和
    
    var memo = [[Int]]()
    func dp(_ s1: [Character], _ i: Int, _ s2: [Character], _ j: Int) -> Int {
        var res = 0
        let m = s1.count
        let n = s2.count
        var dp1 = [Int](repeating: -1, count: n)
        memo = [[Int]](repeating: dp1, count: m)
        // 计算 lcs 长度时，如果一个字符串为空，那么 lcs 长度必然是 0；但是这道题如果一个字符串为空，另一个字符串必然要被全部删除，所以需要计算另一个字符串所有字符的 ASCII 码之和
        
        // base case
        if i == m {
            // 如果 s1 到头了，那么 s2 剩下的都得删除
            for j in j..<n {
                res += Int(s2[j].asciiValue!)
            }
            return res
        }
        
        if j == n {
            // 如果 s2 到头了，那么 s1 剩下的都得删除
            for i in i..<m {
                res += Int(s1[i].asciiValue!)
            }
            return res 
        }
        
        // 有备忘录
        if memo[i][j] != -1 {
            return memo[i][j]
        }
        
        // 存入备忘录
        if s1[i] == s2[j] {
            memo[i][j] = dp(s1, i+1, s2, j+1)
        }else {
            // s1[i] 和 s2[j] 至少有一个不在 lcs 中，删一个
             // 删除s1[i]
             let t1 = dp(s1, i+1, s2, j) + Int(s1[i].asciiValue!)
             // 删除s2[j]
             let t2 = dp(s1, i, s2, j+1) + Int(s2[j].asciiValue!)
             
             memo[i][j] = min(t1, t2)
        }
        
        return memo[i][j]
    }
}
