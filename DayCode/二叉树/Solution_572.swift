//
//  Solution_572.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/7.
//

// 572. 另一棵树的子树
class Solution_572 {
    func isSubtree(_ root: TreeNode?, _ subRoot: TreeNode?) -> Bool {
        if (root == nil && subRoot == nil) {
            return true
        }
        if (root == nil && subRoot != nil) {
            return false
        }
        if isSameTree(root, subRoot) {
            return true
        }
        return  isSubtree(root?.left, subRoot) ||  isSubtree(root?.right, subRoot)
    }
    
    // 是否相等
    func isSameTree(_ root: TreeNode?, _ subRoot: TreeNode?) -> Bool {
        if root == nil && subRoot == nil {
            return true
        }
        if root == nil || subRoot == nil {
            return false
        }else {
            return root?.val == subRoot?.val  && isSameTree(root?.left, subRoot?.left)
            && isSameTree(root?.right, subRoot?.right)
        }
    }
}
