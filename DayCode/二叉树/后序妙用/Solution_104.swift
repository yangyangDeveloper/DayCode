//
//  Solution_104.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/8/3.
//


/*
    考察点：二叉树后序妙用
    思路
    最大深度 其实就是 左子树和右子树最大价 + 1 
*/

// 104. 二叉树的最大深度
class Solution_104 {
    
    /*  递归解法 后序妙用
        想得到一棵树的最大深度 等于 左子树的最大深度  和 右子树的最大深度  然后取最大值 + 1
    */
    func maxDepth2(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        let n = maxDepth2(root?.left)
        let m = maxDepth2(root?.right)
        return max(n, m) + 1
    }
    
    
    // 递归后序妙用
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
    
    
    // BFS + queue
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


