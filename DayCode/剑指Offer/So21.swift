//
//  So21.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/7.
//

// 剑指 Offer 21. 调整数组顺序使奇数位于偶数前面
class So21 {
    
    func exchange(_ nums: [Int]) -> [Int] {
        var res = nums
        var left = 0
        var right = res.count - 1
        
        while left < right {
            
            //如果是奇数
            while left < right && res[left] % 2 != 0 {
                left += 1
            }
            
            while left < right && res[right] % 2 == 0 {
                right -= 1
            }
            // 否者 left为奇 right为偶
            res.swapAt(left, right)
            
        }
        
        return res
        
    }
}
