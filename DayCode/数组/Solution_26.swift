//
//  Solution_26.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/19.
//

/*
    考察点：
    双指针在数组中应用
    双指针中的快慢指针 可以原地修改数组
    fast探路 slow收集
*/

// 26、删除有序数组中的重复项
class Solution_26 {
    // 快慢指针
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        var slow = 0
        var fast = 0
        if nums.count == 0 {
            return 0
        }
        while fast < nums.count {
            if nums[fast] != nums[slow] {
                // 注意是 slow + 1 在前  先移动slow指针 在赋值
                slow += 1
                nums[slow] = nums[fast]
            }
            fast += 1
        }
        return slow + 1
    }
}
