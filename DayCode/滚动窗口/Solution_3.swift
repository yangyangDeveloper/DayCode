//
//  Solution_3.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/7/22.
//

import Foundation

// 滚动窗口
// 3、无重复字符的最长子串
class Solution_3 {
    // 1、 拆分字符串转数组
    // 2、 双指针  每次end 都是 + 1   start是跳跃的
    // 3、 搞一个值 存储  res = mas(res, end - start)
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var arr = Array(s)
        var length = arr.count
        var res = 0, start = 0, end = 0
        var dic = [Character: Int]()
        while start < length && end < length {
            let temp = arr[end]
            // 跳跃 
            if let chaindex = dic[temp] {
                start = max(start, chaindex)
            }
            end += 1
            dic[temp] = end
            res = max(res, end - start)
        }
        return res
    }
}
