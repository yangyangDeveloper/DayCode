//
//  So61.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/1.
//

// 剑指 Offer 61. 扑克牌中的顺子
class So61 {
    
    func isStraight(_ nums: [Int]) -> Bool {
        var list = nums.sorted()
        var jk = 0
        for i in 0..<4 {
            if list[i] == 0 {
                jk += 1
            }
            else {
                if list[i] == list[i + 1] {
                    return false
                }
            }
        }
        
        return list[4] - list[jk] < 5
    }
}
