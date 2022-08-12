//
//  Solution_215.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/7/22.
//

// 215. 数组中的第K个最大元素
class Solution_215 {
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        if nums.count > 0 && k > 0 {
            var arr = nums.sorted()
            var t = arr.count - k
            return arr[t]
        }
        return 0
    }
}
