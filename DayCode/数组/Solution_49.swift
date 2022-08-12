//
//  Solution_49.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/8/12.
//

import Foundation
class Solution_49 {
    /* 多数组进行排序
    array.sorted{$0 > $1}
    array.sorted{$0 < $1}

    // 还可以直接省略参数
    // 升序
    array.sorted(by: <)
    // 降序
    array.sorted(by: >)
    */
    
    // map 返回一个新数组，  map对象是 dict的key  或者 value
    // map({$0.value}) 把dic的value 返回   map({$0.key}) 把dic的key返回
    // $0 来表示闭包的第一个参数  map的第一个参数就是 Self.Element
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var dict = [String: [String]]()
        strs.forEach {
            let s = String($0.sorted(by: <))
            dict[s] = (dict[s] == nil) ? [$0] : dict[s]! + [$0]
        }
        // 返回一个字典的value
        return dict.map({$0.value})
    }
}
