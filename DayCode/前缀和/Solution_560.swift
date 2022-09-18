//
//  Solution_560.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/17.
//

// 560. 和为 K 的子数组
class Solution_560 {
    // 暴力穷举
    func subarraySum(_ nums: [Int], _ k: Int) -> Int {
        var sum = 0
        var count = 0
        
        for i in 0..<nums.count {
            for j in i..<nums.count {
                sum += nums[j]
                if sum == k {
                    count += 1
                }
            }
            sum = 0
        }
        return count
    }
    
    // 前缀和
    func subarraySum2(_ nums: [Int], _ k: Int) -> Int {
        
        var result: Int = 0
        var presum: [Int: Int] = [:]
        var sum: Int = 0
        
        for i in 0 ..< nums.count {
            sum += nums[i]
            if sum == k {
                result += 1
            }
            
            // 新sum 减去k  去找旧的sum  把旧的sum次数拿过来加上
            // 新sum不断的变化 建设来到了13  k = 4  旧sum如果为9就满足需求   查一下是否有9     如果有9 就拿过来
            // 新sum不断变化  假设来到了 15  k = 4  旧sum如果为11就满足需求  查一下map是否有11
            if presum.keys.contains(sum - k) {
                if let count = presum[sum - k] {
                    result += count
                }
            }
            
            // 设置 presum[sum] 默认值为0
            presum[sum, default: 0] += 1
        }
        
        return result
    }
    
}
