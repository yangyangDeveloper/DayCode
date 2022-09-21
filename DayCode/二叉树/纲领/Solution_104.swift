//
//  Solution_104.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/8/3.
//

/*
    考察点： 二叉树的递归遍历解法
    思路：
    1、 可以遍历一遍解决问题  等于回溯思想
    2、 可以分解问题来得到答案  等于动态规划思想
    遍历模版
    // 前序位置
    dfs(root?.left)
    // 中序位置
    dfs(root?.right)
    // 后序位置
    
    本题： 最大深度 其实就是 根节点到叶子结点的最长路径上的节点树
*/

// 104. 二叉树的最大深度
class Solution_104 {
    
    /*  递归解法 动态规划思想
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
    
    // 使用queue
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


