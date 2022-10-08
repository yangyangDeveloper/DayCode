//
//  Solution_870.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/10/8.
//

import Foundation

//870. 优势洗牌
class Solution_870 {


    // value  index 映射  index写成数组防止重复元素
    func advantageCount(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        let t1 = nums1.sorted()
        let t2 = nums2.sorted(by: >)
        var m = [Int: [Int]]()
        for i in 0..<nums2.count {
            let key = nums2[i]
            m[key, default: []].append(i)
        }
        print(m)

        var l = 0, r = t1.count - 1
        var ans = [Int](repeating: 0, count: t1.count)
        for n in t2 {
            if n >= t1[r] { // 混一下
                ans[m[n]!.removeLast()] = t1[l]
                l += 1
            } else {  // 强顶
                ans[m[n]!.removeLast()] = t1[r]
                r -= 1
            }
        }
        return ans
    }
}
