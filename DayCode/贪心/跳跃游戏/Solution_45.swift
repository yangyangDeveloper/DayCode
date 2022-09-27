//
//  Solution_45.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/27.
//

/*
   考察点： 动态规划
            {
                dp[i]  = min(dp[i], dp[j] + 1)
            }
         
          贪心算法
 */
class Solution_45 {
    // 贪心
    // [2,3,1,1,4]
    var fast = 0
    func jump(_ nums: [Int]) -> Int {
        var  end = 0
        var  count = 0
        let n = nums.count
        for i in 0..<n-1 {
            fast = max(fast, i + nums[i])
            
            // 当前的可跳跃范围遍历结束 进入下一个可跳跃范围
            if i == end {
                
                // 每遍历完一个可跳跃范围就相当于做了一次决策
                // 总跳跃次数增加一次
                count += 1
                
                // 更新下一次可跳跃范围的终点
                end = fast
            }
        }
        
        return count
    }
    
    
    // 动态规划
    // dp[i] 从0跳跃到下标i 需要的最少次数
    // 最终需要求 dp[n-1] 即 从 0 跳到 n-1 至少需要多少步
    func jump2(_ nums: [Int]) -> Int {
        let n = nums.count
        var dp = [Int](repeating: n, count: n)
        
        dp[0] = 0
        
        for i in 1..<n {  //  所有的状态列表
            for j in 0..<i { // 所有的选择
                if j + nums[j] >= i  {  // j+nums[j]跳跃能来到或者超越i
                     // dp[i] 默认都是n
                     // 假设比i小的若干j，存在j+nums[j]跳跃能超过i， 判断dp[j]  + 1(来到j的次数 + j到i的这一次) 是否小于默认的n次 最后更新dp[i]
                     dp[i] = min(dp[i], dp[j] + 1)
                }
            }
        }
        
        return dp[n - 1]
    }
}
