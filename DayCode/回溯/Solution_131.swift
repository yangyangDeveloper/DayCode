//
//  Solution_131.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/13.
//

// 131. 分割回文串
class Solution_131 {
    
    /*
     给你一个字符串 s，请你将 s 分割成一些子串，使每个子串都是 回文串 。返回 s 所有可能的分割方案。

     回文串 是正着读和反着读都一样的字符串。
     
     输入：s = "aab"
     输出：[["a","a","b"],["aa","b"]]
     
     */
    func partition(_ s: String) -> [[String]] {
        var res = [[String]]()
        var path = [String]()
        let s = Array(s)
        func backtrace(_ startIndex: Int) {
            
            // 终止条件，收集结果
            if startIndex >= s.count {
                res.append(Array(path))
                return
            }
            
            var str = ""
            for i in startIndex ..< s.count {
                str += String(s[i])
                
                if isPalindrome(str) {
                    path.append(str)
                    backtrace(i + 1)
                    path.removeLast()
                }
            }
        }
        backtrace(0)
        return res
    }
    
    func isPalindrome(_ s: String) -> Bool {
        print(s)
        var s = Array(s)
        var start = 0
        var end = s.count - 1
        while start < end {
            if s[start] != s[end] {
                return false
            }
            start += 1
            end -= 1
        }
        return true
    }
}

