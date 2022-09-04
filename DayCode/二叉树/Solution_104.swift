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
    
    /*  递归
       1、是否为空树 深度为0
       2、否则递归计算左子树的深度记为m  递归右子树深度记为n  二叉树深度就是 max(m，n) + 1
    */
    func maxDepth2(_ root: TreeNode?) -> Int {
        if root == nil { return 0 }
        let n = maxDepth2(root?.left)
        let m = maxDepth2(root?.right)
        return max(n, m) + 1
    }
    
    // 使用 queue
    func maxDepth3(_ root: TreeNode?) -> Int {
        guard root != nil else {
            return 0
        }
        var queue = [TreeNode]()
        var res = 0
        queue.append(root!)
        while queue.count > 0 {
            res += 1
            let size = queue.count
            for i in 0..<size {
                let temp = queue.removeFirst()
                if let left = temp.left {
                    queue.append(left)
                }
                if let right = temp.right {
                    queue.append(right)
                }
            }
        }
       
        return res
    }
}
