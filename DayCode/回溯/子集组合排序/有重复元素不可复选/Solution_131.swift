//
//  Solution_131.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/13.
//

/*
 考察点： 有重复元素 不可复选的
*/

// 131. 分割回文串
class Solution_131 {
    func partition(_ s: String) -> [[String]] {
         var s = s.map({String($0)})
         var res = [[String]]()
         var path = [String]()
         func backtrack(_ startIndex: Int) {
             
             // base case
             if startIndex >= s.count {
                 res.append(path)
                 return
             }
             
             // 只负责当前一层
             var str = String()
             for i in startIndex..<s.count {
                 str += s[i] // 这里添加就行了  str 不需要回溯
                 if isPalindrome(str) {
                     path.append(str)
                     backtrack(i + 1)
                     path.removeLast()
                 }
             }
         }
         backtrack(0)
         return res
     }

     func isPalindrome(_ s: String) -> Bool {
         var s = s.map({String($0)})
         var left = 0
         var right = s.count - 1
         while left < right {
             if s[left] != s[right] {
                 return false
             }
             left += 1
             right -= 1
         }
         return true
     }
}

