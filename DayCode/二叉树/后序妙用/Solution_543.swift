//
//  Solution_543.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/21.
//

/*
    考察点：二叉树后序妙用
    思路：
    最初想法：
    1、二叉树的直径，就是左右子树的最大深度之和(可以不经过根节点)，那么直接的想法是对每个节点计算左右子树的最大高度，得出每个节点的直径，从而得出最大的那个直径
    2、但是由于 maxDepth 也是递归函数，上述方式时间复杂度较高。
*/

// 二叉树的最长直径
class Solution_543 {
        
    // 优化后的解法
    // 前序写法 因为前序无法获取子树信息，所以需要调用 dfs 进行计算  而我们可以在后序位置加入代码 代码就变得简洁了 效率提高了
    var res = 0
    func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
        dfs(root)
        return res
    }
    
    func dfs(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        // 对每个节点计算直径
        var leftmax = dfs(root?.left)
        var rightmax = dfs(root?.right)
        // 我们在后序位置加入我们的逻辑   统计这个节点的 最大路径
        // 更新全局最大直径
        res = max(res, leftmax + rightmax)
        return max(leftmax, rightmax) + 1
    }
    
/*
    // 二叉树的直径
    var res = 0

    func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
        traverse(root)
        return res
    }
    
    func traverse(_ root: TreeNode?) {
        if root == nil {
            return
        }
        // 对每个节点计算直径
        var leftmax = dfs(root?.left)
        var rightmax = dfs(root?.right)
        // 更新全局最大直径
        res = max(res, leftmax + rightmax)
     
        traverse(root?.left)
        traverse(root?.right)
    }

    func dfs(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        let leftcount = dfs(root?.left)
        let rightcount = dfs(root?.right)
        return max(leftcount, rightcount) + 1
    }
*/
}
