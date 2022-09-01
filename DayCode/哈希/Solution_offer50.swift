//
//  Solution_offer50.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/8/31.
//

import Foundation

// 哈希
class Solution_offer50 {
    
    func firstUniqChar(_ s: String) -> Character {
        let a: Character = "a"
        let a_ascii =  a.asciiValue
        //情况一：判空
        if s.count == 0 {
            return " "
        }
        var arr = Array(repeating:0,count: 26) //创建了26个元素个个值全为0的数组
        for char in s {
            let tem = Int(char.asciiValue! - a_ascii!)//强制解包，否则将返回一个可选数据类型报错
            arr[tem] += 1
        }
        for char in s {
            let tem = Int(char.asciiValue! - a_ascii!)
            if arr[tem] == 1 {
                return char
            }
        }
        return " "
    }
}
