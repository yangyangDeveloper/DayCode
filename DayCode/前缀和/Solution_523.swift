//
//  Solution_523.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/20.
//

import Foundation
class Solution_523 {
    func checkSubarraySum(_ nums: [Int], _ k: Int) -> Bool {
        guard nums.count > 1 else {
            return false
        }
        var map = [Int:Int]()
        map[0] = -1
        var remainder = 0
        for i in (0 ..< nums.count) {
            remainder = (remainder + nums[i]) % k
            if (map.keys.contains(remainder)) {
                let preIndex = map[remainder]!
                if (i - preIndex >= 2) {
                    return true
                }
            } else {
                map[remainder] = i
            }
        }
        return false
    }
}
