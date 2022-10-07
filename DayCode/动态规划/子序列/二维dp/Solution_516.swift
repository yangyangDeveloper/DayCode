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
        var s = s
        var s1 = s
        var s2 = revers(s)
        let t = longestCommonSubsequence(s1, s2)
        return t
    }

    func revers(_ s: String) -> String {
        
        var s = s.map({String($0)})
        var left = 0
        var right = s.count - 1
        while left < right {
            var temp = s[right]
            s[right] = s[left]
            s[left] = temp
            left += 1
            right -= 1
        }
        return s.joined()
    }

    func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
         let m = text1.count
         let n = text2.count

         var s1 = text1.map({String($0)})
         var s2 = text2.map({String($0)})

         var dp1 = [Int](repeating: 0, count: n + 1)
         var dp = [[Int]](repeating: dp1, count: m + 1)

         for i in 1...m {
             for j in 1...n {
                 // 现在 i 和 j 从 1 开始，所以要减一
                 if s1[i - 1] == s2[j - 1] {
                     // 从对角线过来  // s1[i-1] 和 s2[j-1] 必然在 lcs 中
                     dp[i][j] = 1 + dp[i - 1][j - 1]
                 }else {
                     // 上左最大    // s1[i-1] 和 s2[j-1] 至少有一个不在 lcs 中
                    dp[i][j] = max(dp[i - 1][j], dp[i][j - 1])
                 }
             }
         }
         return dp[m][n]
    }
}
