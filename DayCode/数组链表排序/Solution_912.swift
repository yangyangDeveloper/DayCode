//
//  Solution_912.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/22.
//

import Foundation

class Solution_912 {
    
    // 创建一个临时辅助数组
    var temp = [Int]()
    var curindex = 0
    func sortArray(_ nums: [Int]) -> [Int] {
        var nums = nums
        let n = nums.count
        guard n > 1 else {
            return nums
        }
        temp = [Int](repeating: 0, count: nums.count)
        mergeSort(&nums, 0, n - 1)
        return nums
    }
    
    // 将数组 nums[left..right] 进行排序
    func mergeSort(_ nums: inout [Int], _ left: Int, _ right: Int) {
        // 分离到只有1个元素
        if left >= right {
            return
        }
        let mid = left + (right - left) / 2
        mergeSort(&nums, left, mid)
        mergeSort(&nums, mid + 1, right)
        print("left == \(left), right == \(right), mid ==\(mid)")
        merge(&nums, left, mid, right)
    }

    // 给2个数组 进行合并到一个有序数组  【left mid】 和  【mid+1  right】 合并在一起
    func merge(_ nums : inout [Int], _ left: Int, _ mid: Int, _ right: Int)  {
       
        for i in left...right {
            temp[i] = nums[i]
        }
        
        var i = left
        var j = mid + 1
        
        for p in left...right {
            if i == mid + 1 {   // i的区间为 [left mid]  i = mid + 1 就说明 左边装满了
                // 左半数组已全部被合并
                nums[p] = temp[j]
                j += 1
            }else if j == right + 1 { // j的区间为 [mid+1, right] j = right + 1 就说明 右边装满了
                //右半边数组已全部被合并
                nums[p] = temp[i]
                i += 1
            }else if temp[i] < temp[j] {
                nums[p] = temp[i]
                i += 1
            }else {
                nums[p] = temp[j]
                j += 1
            }
        }
        
       print(nums)
    }
}
