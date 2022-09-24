//
//  Solution_1143.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/24.
//

/*
    考察点： dp 两个字符串 lcs 模版
    寻找s1[i..] 和 s2[j..] lcs
 
 */
// 1143. 最长公共子序列
class Solution_1143 {
    
    // 解法1 暴力穷举
    func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
        var m = text1.count
        var n = text2.count
        return dp(text1, 0, text2, 0)
    }
    
    // 寻找s1[i..] 和 s2[j..] lcs
    func dp(_ s1: String,_ i: Int, _ s2: String, _ j: Int) ->Int {
        var s1 = s1.map({String($0)})
        var s2 = s2.map({String($0)})
        
        // base case
        if i == s1.count || j == s1.count {
            return 0
        }
        
        if s1[i] == s2[i] {
            return 1 + dp(s1.joined(), i + 1, s2.joined(), j + 1)
        } else {
            return max(dp(s1.joined(), i + 1 , s2.joined(), j), dp(s1.joined(), i, s2.joined(), j + 1))
        }
    }
   
    /*
     
     解法一： 暴力递归
     
     func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
         var m = text1.count
         var n = text2.count
         var s1 = text1.map({String($0)})
         var s2 = text2.map({String($0)})
         return dp(s1, 0, s2, 0)
     }

     func dp(_ s1: [String] ,_ i: Int, _ s2: [String], _ j: Int) ->Int {
         // base case
         if i == s1.count || j == s2.count {
             return 0
         }
         if s1[i] == s2[j] {
             return 1 + dp(s1, i + 1, s2, j + 1)
         } else {
             return max(dp(s1, i + 1 , s2, j), dp(s1, i, s2, j + 1))
         }
     }
     
    */

    
    /*
     
    解法二 备忘录
    var memo = [[Int]]()
    func longestCommonSubsequence2(_ text1: String, _ text2: String) -> Int {
        var m = text1.count
        var n = text2.count
        var s1 = text1.map({String($0)})
        var s2 = text2.map({String($0)})
        memo = [[Int]](repeating: [Int](repeating: -1, count: n), count: m)
        return dp2(s1, 0, s2, 0)
    }

    func dp2(_ s1: [String],_ i: Int, _ s2: [String], _ j: Int) ->Int {
        // 好处字符串了
        if i == s1.count || j == s2.count {
            return 0
        }
        //  取出备忘录
        if memo[i][j] != -1 {
            return memo[i][j]
        }
        
        // 存入备忘录
        if s1[i] == s2[j] {
            // dp方程
            memo[i][j] =  1 + dp2(s1, i + 1, s2, j + 1)
        } else {
            memo[i][j] =  max(dp2(s1, i + 1 , s2, j), dp2(s1, i, s2, j + 1))
        }
        return memo[i][j]
    }
    */
    
    

/*
    解法三 dp

    dp[i][j] 表示text1的前i个元素与text2的前j个元素的最长公共子序列长度;
    如果text1[i-1] == text2[j-1]，那么dp[i][j] = dp[i-1][j-1] + 1;
    如果text1[i-1] != text2[j-1]，那么dp[i][j] = max(dp[i-1][j], dp[i][j-1]);

    想清楚上面的关系，问题就迎刃而解了。
 
    定义dp长度从 1 到  m + 1    从1开始遍历
*/
    var dp = [[Int]]()
    func longestCommonSubsequence3(_ text1: String, _ text2: String) -> Int {
        let m = text1.count
        let n = text2.count
        dp = [[Int]](repeating: [Int](repeating: 0, count: n + 1), count: m  + 1)
        
        let s1 = text1.map({String($0)})
        let s2 = text2.map({String($0)})
            
        for i in 1...m {
            for j in 1...n {
                // 现在 i 和 j 从 1 开始，所以要减一
                if s1[i - 1] == s2[j - 1] {
                    dp[i][j] = 1 + dp[i - 1][j - 1]
                }else {
                    dp[i][j] = max(dp[i - 1][j], dp[i][j - 1])
                }
            }
        }
        return dp[m][n]
    }
}
