//
//  Solution_26.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/19.
//

/*
   考察点： 数组的快慢指针技巧  原地修改数组
   [0 slow] 为我们需要的区间
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
