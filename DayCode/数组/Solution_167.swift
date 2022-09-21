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

    左右指针考点：
    1、 二分查找
    2、 两数之和
    3、 反转数组
    前3个是从左右往中心走  回文是从中心往两边走
    4、 是否为回文串的判断：
    5、 最长回文串： 从中心向两端扩散的双指针技巧
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
