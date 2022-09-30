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
    
    // 滑动窗口思想

    func lengthOfLongestSubstring2(_ s: String) -> Int {
        // 收缩窗口： 窗口字符重复出现收缩窗口  不需要need valid去匹配了  单纯的扣 windows 不能有重复
        // 收集答案： 在扩展窗口时候更新
        var windows = [String: Int]()
        let s = s.map({String($0)})
        var left = 0
        var right = 0
        var res = 0
        
        while right < s.count {
            let c = s[right]
            right += 1
            windows[c, default: 0] += 1
            while windows[c, default: 0] > 1 {
                let d = s[left]
                left += 1
                windows[d, default: 0] -= 1
            }
            res = max(res, right - left)
            
        }
        return res
    }
    
    
    // 显得杂乱无章 没有模版思想
    
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
