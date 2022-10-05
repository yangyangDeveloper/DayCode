//
//  Solution_42.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/27.
//

/*
    考察点： 双指针 
    解法一: 找 i的 左边最大  和  右边最大 确定边界之后找 i的雨水  water[i] =  min(l_max[i]m r_max[i]) - height[i]
    解法二: 双指针 
 */

// 42. 接雨水
class Solution_42 {
    
    // 定义 left 为 i  左边 不包含i 最大值
    // 定义 right 为 i 右边 不包含i 最大值
    func trap(_ height: [Int]) -> Int {
        let n = height.count
        var left = [Int](repeating: 0, count: n)
        var right = [Int](repeating: 0, count: n)
        
        // i左边最大的值
        for i in 1..<n {
            left[i] = max(left[i - 1], height[i - 1])
        }
        print("nb")
        // 防止越界 所欲用n-1  i右边最大值
        for i in (0..<n-1).reversed() {
            right[i] = max(right[i + 1], height[i + 1])
        }
        
        print("nb")
        var water = 0
        for i in 0..<n {
            var level = min(left[i], right[i])
            water += max(0, level - height[i])
        }
        return water
    }
    
    
    // r_max 和 l_max 充当备忘录
    // l_max[i] 表示位置 i 左边最高的柱子高度 [0..i] 包含i
    // r_max[i] 表示位置 i 右边最高的柱子高度  [0..1] 包含i
    func trap2(_ height: [Int]) -> Int {
         let n = height.count
         if n == 0 || n == 1 {
             return 0
         }
        
        var l_max = [Int](repeating: 0, count: n)
        var r_max = [Int](repeating: 0, count: n)
        var res = 0
        l_max[0] = height[0]
        r_max[n-1] = height[n-1]
        
        // 从左到右 找到lmax
        for i in 1..<n {
            l_max[i] = max(l_max[i - 1], height[i])
        }
        
        // 从右到左 找到rmax
        for i in (0...n-2).reversed() {
            r_max[i] = max(r_max[i + 1], height[i])
        }
        
        // 计算答案
        for i in 1..<n-1 {
            res += min(l_max[i], r_max[i]) - height[i]
        }
        
        return res
    }
    
    
    // 双指针解法
    // 当l比r低的时候，l指针从左往右移动，因为右边有更高的柱子，左边有高度差就可以接到雨水，左边l与左边最高柱间的差值就是当前l格的接水量。
    // 同理，当r比l低的时候，r指针从右往左，因为左边有更高的柱子，右边有高度差就可以接到雨水，右边r与右边最高柱间的差值就是当前r格的接水量
    func trap3(_ height: [Int]) -> Int {
        let n = height.count
        var l_max = 0
        var r_max = 0
        var left  = 0
        var right = n - 1
        
        var res = 0
        while left < right {
            // 行进过程中记录当前能探测到的最左边高度  和 最右边高度
            l_max = max(l_max, height[left])
            r_max = max(r_max, height[right])
            
            // 当l比r低的时候，l指针从左往右移动，因为右边有更高的柱子，左边有高度差就可以接到雨水，左边l与左边最高柱间的差值就是当前l格的接水量。
            // 同理，当r比l低的时候，r指针从右往左，因为左边有更高的柱子，右边有高度差就可以接到雨水，右边r与右边最高柱间的差值就是当前r格的接水量
            if l_max < r_max {
                res += l_max - height[left]
                left += 1
            }else {
                res += r_max - height[right]
                right -= 1
            }
        }
        return res
    }
}
