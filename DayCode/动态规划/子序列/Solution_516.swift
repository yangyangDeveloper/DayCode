//
//  Solution_516.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/24.
//

/*
 
  考察点： dp 子序列问题
  
 */
// 516. 最长回文子序列
class Solution_516 {

    /*
        dp[i][j] 代表的是 i 到 j 里面最长的回文子序列
        dp[0][n-1] 就是就是整个完成串串子

        dp[0][n-1]
        dp[i][j]
        if i == j  dp[i][j] = 2 + dp[i + 1][j - 1]  // 左下边  自己在右上边
        if i != j  dp[i][j] = max(dp[i + 1][j], dp[i][j-1]) // 左边和下边

        左   我们要的结果
        左下 下

        决定遍历顺序
        j 正
        i 到序
        保证 左 坐下 下 能优先计算出来 最后到右上
    */
    
    func longestPalindromeSubseq(_ s: String) -> Int {
        var s = Array(s)
        var n = s.count
        var dp = [[Int]](repeating: [Int](repeating: 0 ,count: n), count: n)

        // base case
        for i in 0..<n {
            dp[i][i] = 1
        }
        
        for i in (0..<n).reversed() {
            for j in i+1..<n {
                print("i ==\(i), j =\(j)")
                if s[i] == s[j] {
                    dp[i][j] =  dp[i+1][j-1] + 2
                }else {
                    dp[i][j] = max(dp[i+1][j], dp[i][j-1])
                }
            }
        }
        return dp[0][n - 1]
    }
    
    /*
      解法二： 把s1 反转成 s2  求 s1和s2的lcs 就是 
     
     */
    func longestPalindromeSubseq2(_ s: String) -> Int {
        var s = Array(s)
        var n = s.count
        var dp = [[Int]](repeating: [Int](repeating: 0 ,count: n), count: n)

        // base case
        for i in 0..<n {
            dp[i][i] = 1
        }
        
        for i in (0..<n).reversed() {
            for j in i+1..<n {
                print("i ==\(i), j =\(j)")
                if s[i] == s[j] {
                    dp[i][j] =  dp[i+1][j-1] + 2
                }else {
                    dp[i][j] = max(dp[i+1][j], dp[i][j-1])
                }
            }
        }
        return dp[0][n - 1]
    }
}
