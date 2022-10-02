//
//  Solution_572.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/7.
//


/*
    考察点： 子结构 和 子树 还是有区别的
    子结构 可以允许一部分相同  子树是从那一刻开始往下都要相等 子树是从某一个节点开始 一直到叶子结点完全相等
 */

// 572. 另一棵树的子树
class Solution_572 {
    func isSubtree(_ root: TreeNode?, _ subRoot: TreeNode?) -> Bool {
         if root == nil  {
             return subRoot == nil
         }
         // 判断以 root 为根的二叉树是否和 subRoot 相同
         if root!.val == subRoot!.val && compareTree(root, subRoot) {
             return true
         }
         // 去左右子树中判断是否有和 subRoot 相同的子树
         return isSubtree(root?.left, subRoot) || isSubtree(root?.right, subRoot)
    }

    // 递归就是写好basecase 然后递归无限接近basecase
    // 比较两棵树是否相同
    func compareTree(_ root1: TreeNode?, _ root2: TreeNode?) ->Bool {
        
        // 判断一对节点是否相同
        if root1 == nil && root2 == nil {
            return true
        }

        if root1 == nil || root2 == nil {
            return false
        }

        if root1?.val != root2?.val {
            return false
        }

        // 比较其他节点
        return compareTree(root1?.left, root2?.left) && compareTree(root1?.right, root2?.right)
    }
}
