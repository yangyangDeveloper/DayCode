//
//  Solution_131.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/13.
//

import Foundation
class Solution_131 {
    
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

