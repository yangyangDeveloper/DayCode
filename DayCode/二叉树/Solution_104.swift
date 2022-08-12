//
//  Solution_104.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/8/3.
//

// 104. 二叉树的最大深度
class Solution_104 {
    
    func maxDepth(_ root: TreeNode?) -> Int {
        return dfs(root)
    }
    
    func dfs(_ root: TreeNode?) -> Int {
        if root == nil {
         return 0
        }
         // 每一层为下一层要结果
        return max(dfs(root?.left), dfs(root?.right)) + 1
    }
}
