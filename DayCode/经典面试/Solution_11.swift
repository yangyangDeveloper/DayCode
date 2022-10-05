//
//  Solution_11.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/27.
//

/*
 
   考察点 ：双指针
   比 接雨水容易  结雨水 知道左边和右边 不能算出来容量  他需要考虑左边高度和右边高度 然后 减去自己高度
   这个等于 找左边长 右边长  然后乘以宽度 获取巨型面积
   这个知道 height[left] 和 height【right】 就可以知道 【left ... right】的雨水
    
   面积 =  min(height[left], height[right]) * (right - left)
   如果 右边的大
   我们移动左边较低的一方  左边的边可能会变高 让巨型的面积高度变大 就有了可能性
*/


// 11. 盛最多水的容器
class Solution_11 {
    
    func maxArea(_ height: [Int]) -> Int {
        let n = height.count
        var left = 0
        var right = n - 1
        var maxarea = Int.min
        
        var area = 0
        while left < right {
            area = min(height[left], height[right]) * (right - left)
            maxarea = max(maxarea, area)
            
            if height[left] < height[right] {
                left += 1
            }else {
                right -= 1
            }
        }
        
        return maxarea
    }
}

