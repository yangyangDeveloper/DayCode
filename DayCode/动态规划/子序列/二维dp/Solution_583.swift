//
//  Solution_583.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/24.
//

/*
    考察点： 两个字符串lcs 模版
    思路：  找到lcs长度 然后 （m - lcs）  +  （n - lcs） 就是最少步数
 */

//583. 两个字符串的删除操作
class Solution_583 {
    
    /*
     
     dp[i][j]  s1[0..i] 和 s2[0..j] 的最长lcs
     i j  从 1 开始
     注意 比较字符串时候 i - 1 j - 1
     
     */
    func minDistance(_ word1: String, _ word2: String) -> Int {
        var m = word1.count
        var n = word2.count
        var s1 = word1.map({String($0)})
        var s2 = word2.map({String($0)})
         
        var lcs = lcs(s1, 0, s2, 0)
        return (m - lcs) + (n - lcs)
    }
    
    // 从i j 开始的 str1 和 str2 的lcs
    var dp = [[Int]]()
    func lcs(_ s1:[String], _ i: Int, _ s2: [String], _ j : Int) -> Int {
        let m = s1.count
        let n = s2.count
        dp = [[Int]](repeating: [Int](repeating: 0, count: n + 1), count: m + 1)

        for i in 1...m {
            for j in 1...n {
                if s1[i - 1] == s2[j - 1] {
                    // 在lcs中
                    dp[i][j] = 1 + dp[i - 1][j - 1]
                }else {
                    // 最少一个不在lcs中
                    dp[i][j] = max(dp[i - 1][j], dp[i][j - 1])
                }
            }
        }
        return dp[m][n]
    }
}
