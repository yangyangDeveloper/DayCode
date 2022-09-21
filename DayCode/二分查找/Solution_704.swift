//
//  Solution_704.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/1.
//

/*
   考察点：  二分查找模版的通用写法
 
   1、 找一个就返回   1 2 3 4 5  找到一个2就返回
   2、 存在多个2的找左边界   1 2 2 2 2 5  找2的左边界
   3、 存在多个2的找右边界   1 2 2 2 2 5  找2的右边界
    
 */

class Solution_704 {
    /*
      1、有序
      2、分界 mid = left + (right -left) // 防止溢出
      3、区间选择   while (left <= right)
          1、mid值 > target  target 就在左区间 那么 [left mid-1]
          2、mid值 < target  target 就在右区间 那么 [mid+1, right]
          3、mid值 = target   return mid
          否则 return - 1
    */
    func search(_ nums: [Int], _ target: Int) -> Int {
        var left = 0
        var right = nums.count - 1
        while left <= right {
            var mid = left + (right - left) / 2
            if nums[mid] == target {
                return mid
            }else if nums[mid] > target {
                right = mid - 1
            } else {
                left = mid + 1
            }
        }
        return -1
    }
}
