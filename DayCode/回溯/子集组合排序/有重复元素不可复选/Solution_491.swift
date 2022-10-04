//
//  Solution_491.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/14.
//

/*
  考察点： 有重复元素 不可重复选择
  细节： 1、 这个题目 不能排序 因为人家要的原本的顺序  所以我们只有通过 set去重
        2、 set 只负责本层 所以不需要回溯
        3、 收集答案之后 不需要 return
*/

// 491. 递增子序列 不需要连续
// 674  最长连续递增序列  这个需要连续

class Solution_491 {
    func findSubsequences(_ nums: [Int]) -> [[Int]] {
         var res = [[Int]]()
         var path = [Int]()

         func backtrack(_ startIndex: Int) {
       
             if path.count > 1 {
                 // 收集结果，但不返回，因为后续还要以此基础拼接
                 res.append(path)
             }

             if startIndex >= nums.count {
                 return
             }
             
             var uset = Set<Int>()  // 记录本层元素是否重复使用，新的一层uset都会重新定义（清空），所以要知道uset只负责本层！
             for i in startIndex..<nums.count {
                 // 移除重复
                 if uset.contains(nums[i]) {
                     continue
                 }
                 
                 // 保证递增
                 if path.count > 0 && path.last! > nums[i] {
                     continue
                 }
                 // 记录本层元素是否重复使用，新的一层uset都会重新定义
                 uset.insert(nums[i])  // 后面不需要 移除
                 path.append(nums[i])
                 backtrack(i + 1)
                 path.removeLast()
             }
         }

         backtrack(0)
         return res
     }
    
    
    // 最长连续递增
    func findLengthOfLCIS(_ nums: [Int]) -> Int {
        if nums.count == 1 {
            return 1
        }
        var dp = [Int](repeating: 1, count: nums.count)
        var res = 0
        for i in 0..<nums.count - 1 {
            if nums[i + 1] > nums[i] {
                dp[i + 1] = dp[i] + 1
            }
            res = max(res, dp[i + 1])
        }
        return res
    }

}
