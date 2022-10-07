//
//  Solution_167.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/19.
//

/*
    考察点：
    双指针在数组中的玩法
    双指针中的左右指针 -> 两数之和
*/

// 167. 两数之和 II - 输入有序数组
class Solution_167 {
    
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        var left = 0
        var right = numbers.count - 1
        while left < right {
            let sum = numbers[left] + numbers[right]
            if sum == target {
                return [left + 1, right + 1]
            } else if  sum < target  {
                // 让sum大一些
                left += 1
            } else {
                right -= 1
            }
        }
        return [-1, -1]
    }
}
