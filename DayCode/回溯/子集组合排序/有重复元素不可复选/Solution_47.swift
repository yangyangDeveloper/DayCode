//
//  Solution_47.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/14.
//


/*
   考察点： 排列 有重复元素不可复选的框架
   思路： 使用 2个剪支逻辑
    if  used[i] {
        continue
    }
    
    if i > 0 && nums[i] = nums[i - 1] && !used[i - 1] {
        continue
    }
*/


// 47. 全排列 II
class Solution_47 {

    /*
     给定一个可包含重复数字的序列 nums ，按任意顺序 返回所有不重复的全排列。
     输入：nums = [1,1,2]
     输出：
     [[1,1,2],
     [1,2,1],
     [2,1,1]]
     
     */
    
    func permuteUnique(_ nums: [Int]) -> [[Int]] {
        var res:[[Int]] = []
        var used: [Bool] = Array(repeating: false, count: nums.count)
        var path: [Int] = []
        
        var arr = nums.sorted()
        
        
        dfs(arr)
        func dfs(_ nums: [Int]) {
            guard path.count != nums.count else {
                res.append(path)
                return
            }
            
            for i in 0 ..< nums.count {
                /*
                 剪枝条件1：
                 搜索起点与上一次搜索的起点一样
                 */
                if used[i] {
                    continue
                }
                
                /*
                 剪枝条件2：（之前已经进行了排序，所以此处可以直接拿i与i-1位进行比较）
                 第i与第i-1位相同，且第i-1位未被使用
                 此处可以这么理解：
                 当前搜索的数字和上次的一样，但是上一次的刚被撤销，正是因为刚被撤销，下面的搜索还会被用到，因此会产生重复，那么就应该剪枝
                 */
                if i > 0 && nums[i] == nums[i - 1] && !used[i - 1] {
                    continue
                }
                path.append(nums[i])
                used[i] = true
                dfs(nums)
                path.removeLast()
                used[i] = false
            }
        }
        return res
    }
}
