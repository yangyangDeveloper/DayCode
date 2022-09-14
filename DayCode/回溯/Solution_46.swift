//
//  Solution_46.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/13.
//


// 46. 全排列
class Solution_46 {
    /*
     给定一个不含重复数字的数组 nums ，返回其 所有可能的全排列 。你可以 按任意顺序 返回答案。
     输入：nums = [1,2,3]
     输出：[[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]
     */
    
    func permute(_ nums: [Int]) -> [[Int]] {
        var res = [[Int]]()
        var path = [Int]()
        func backtrace() {
            if path.count == nums.count {
                res.append(Array(path))
            }
            
            for i in 0 ..< nums.count {
                // 每向下递推一层就是在「可选元素列表」中选择一个「元素」加入到「当前状态」
                if path.contains(nums[i]) {
                    continue  // 从当前路径中没有出现的数字中选择
                }
                path.append(nums[i])
                backtrace()
                path.removeLast()
            }
        }
        backtrace()
        return res
    }
}
