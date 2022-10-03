//
//  Solution_46.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/13.
//


/*
   考察点： 排列 无重复元素不可复选的框架
   思路： for 循环是从 0 开始的 因此去重 需要一个 used数组 
*/

// 46. 全排列
class Solution_46 {
    /*
     给定一个不含重复数字的数组 nums ，返回其 所有可能的全排列 。你可以 按任意顺序 返回答案。
     输入：nums = [1,2,3]
     输出：[[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]
     */
//
//    func permute(_ nums: [Int]) -> [[Int]] {
//        var res = [[Int]]()
//        var path = [Int]()
//        func backtrace() {
//            if path.count == nums.count {
//                res.append(Array(path))
//            }
//
//            for i in 0 ..< nums.count {
//                // 每向下递推一层就是在「可选元素列表」中选择一个「元素」加入到「当前状态」
//                if path.contains(nums[i]) {
//                    continue  // 从当前路径中没有出现的数字中选择
//                }
//                path.append(nums[i])
//                backtrace()
//                path.removeLast()
//            }
//        }
//        backtrace()
//        return res
//    }
//
     
    
    // 模版题解
    // 无重复元素 不可复选 全排列  used
    var used = [Bool]()
    var res = [[Int]]()
    var path = [Int]()
    func permute(_ nums: [Int]) -> [[Int]] {
        
        func backtrack() {
            if path.count == nums.count {
                res.append(path)
                return
            }
            
            for i in 0..<nums.count {
                if used[i] {
                    continue
                }
                used[i] = true
                path.append(nums[i])
                backtrack()
                path.removeLast()
                used[i] = false
            }
        }
        
        used = [Bool](repeating: false, count: nums.count)
        backtrack()
        return res
    }
}
