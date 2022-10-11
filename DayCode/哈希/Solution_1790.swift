//
//  Solution_1790.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/10/11.
//

// 1790. 仅执行一次字符串交换能否使两个字符串相等
class Solution_1790 {
    // 找到公共子串长度 n    n + 2 >  s2.count  就是ture
    func areAlmostEqual(_ s1: String, _ s2: String) -> Bool {
        var s1 = s1.map({String($0)})
        var s2 = s2.map({String($0)})
        var need1 = [String: Int]()
        var need2 = [String: Int]()

        var p1 = 0
        var p2 = 0
        var res = 0
        // 找到相同的子串长度
        while p1 < s1.count && p2 < s2.count {
            if s1[p1] == s2[p2] {
                res += 1
            }
            need1[s1[p1], default: 0] += 1
            need2[s2[p2], default: 0] += 1
            p1 += 1
            p2 += 1
        }
        if need1 == need2 {
             // 2个不一样  交换一次就ok
            if s1.count - res <= 2 {
                 return true
            }
            return false
        }
    
        return false
    }
}
