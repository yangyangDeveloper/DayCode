//
//  Solution_14.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/11/4.
//

// 14. 最长公共前缀

//  分治思想法 + 递归
// 通过分析，求最长公共长度是满足结合律的，如：
// LCP(s1...sn) = LCP(LCP(s1,sk),LCP(sk+1,sn))。通过该特性就可以利用分支思想来求解
// 求一个问题的解，可以分解为两个子问题的解，对两个子问题分别求解，然后对两个子问题的解计算最长公共前缀，即为原问题的解，针对分治思想可以利用递归调用来实现
class Solution_14 {
    
    // 分治思想 + 递归
    func longestCommonPrefix(_ strs: [String]) -> String {
        if strs.count <= 0 {
            return ""
        }
        return findLCP(strs, 0, strs.count-1)
    }

    func findLCP(_ strs:[String], _ start: Int,  _ end: Int) -> String {
        if start >= end {
            return strs[start]
        }
        let mid = start + (end - start) / 2
        let leftStr = findLCP(strs, start, mid)
        let rightStr = findLCP(strs, mid + 1, end)
        return commonPrefix(leftStr, rightStr)
    }

    func commonPrefix(_ str1: String, _ str2: String) -> String {
        let leftStr = str1
        let rightStr = str2
        if leftStr.count <= 0 || rightStr.count <= 0 {
            return ""
        }
        let leftArray = Array(leftStr)
        let rightArray = Array(rightStr)
        let minCount = min(leftArray.count, rightArray.count)

        for i in 0..<minCount {
            if leftArray[i] != rightArray[i] {
                return String(leftStr.prefix(i))
            }
        }
        return String(leftStr.prefix(minCount))
    }
}
