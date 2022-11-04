//
//  Solution_58.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/11/4.
//

// 58. 最后一个单词的长度
class Solution_58 {
    func lengthOfLastWord(_ s: String) -> Int {
        var s = s
        var str = s.trimmingCharacters(in: .whitespaces)
        var strA = str.map({String($0)})
        var res = 0
        var count = 0
        for char in strA {
            if char != " " {
                count += 1
            }else {
                count = 0
            }
        }
        return count
    }
}
