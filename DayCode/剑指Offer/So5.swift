//
//  So5.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/2.
//

// 剑指 Offer 05. 替换空格
class So5 {
    func replaceSpace(_ s: String) -> String {
        if s.count == 0 {
            return ""
        }
        var temp = ""
        for char in s {
            temp = temp + (char.isWhitespace ? "%20" : String(char))
        }
        return temp
    }
}
