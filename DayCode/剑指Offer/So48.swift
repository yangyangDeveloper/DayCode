//
//  So48.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/7.
//

// 剑指 Offer 48. 最长不含重复字符的子字符串
class So48 {
    
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var dic = [Character: Int]()
        var res = 0
        var start = 0
        var end = 0
        
        for item in s {
            let tep = dic[item] ?? -1  //
            // start 拥有是不重复子串的头部  a跳跃的位置是
            start = max(start, tep)
            
            // 更新res
            res = max(end - start + 1 , res)
            
            // 数组里面一直存储的a的下标 所以需要+1   因为end是重复的 是从下一个才是干净的
            end += 1
            dic[item] = end
        }
        return res
    }
    
}
