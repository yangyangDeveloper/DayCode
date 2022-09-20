//
//  Solution_567.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/20.
//

//  字符串的排列
class Solution_567 {
    // 滑动窗口
    // 这个题的窗口大小固定 一直都是2  不会增大 缩小  而是一直是2  去滚动  属于固定窗口滚动
    func checkInclusion(_ s1: String, _ s2: String) -> Bool {
        // 边界判断
        if s1 == "" || s2 == "" {
            return false
        }

        if s1.count > s2.count {
            return false
        }
        
        // if s1.count == s2.count {
        //     return s1 == s2 ?  true : false
        // }
 
        var s1 = s1.map({String($0)})
        var need = [String: Int]()
        for c in s1 {
            need[c, default: 0] += 1
        }

        // 符合条件的个数
        var vivad = 0

        var window = [String: Int]()
        var s2 = s2.map({String($0)})
        var left = 0
        var right = 0

        while right < s2.count {
            
            var c = s2[right]
            // 扩展窗口
            right += 1

            if let t = need[c] {
                window[c, default: 0] += 1
                if window[c] == need[c] {
                    vivad += 1
                }
            }

            // 符合条件就进来判断
            while right - left >= s1.count {
                if vivad == need.count {
                    return true
                }

                var d = s2[left]
                left += 1

                // 更新操作
                if let t = need[d] {
                    if window[d] == need[d] {
                        vivad -= 1
                    }
                    window[d, default:0] -= 1
                }
            }
        }
        
        return false
    }
}
