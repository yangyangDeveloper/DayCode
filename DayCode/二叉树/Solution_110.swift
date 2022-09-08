//
//  Solution_110.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/6.
//

// 110. 平衡二叉树
// 判断一棵树是不是平衡二叉树
// 平衡二叉树定义：左右子树最大高度差<=1
// 特殊判断：空树是平衡树
// 返回值： 左子树是平衡二叉树  右之树是平衡二叉树  结点的左右子树差为1 
class Solution {
    
    var differ = 0
    func isBalanced(_ root: TreeNode?) -> Bool {
        if root == nil {
            return true
        }
        helper(root)
        return differ > 1 ? false : true
    }
    
    func helper(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        let left = helper(root?.left)
        let right = helper(root?.right)
        
        // 偷偷插入我的代码
        // 在这里记录左右子树的最大高度差,用于后面判断是否为平衡树
        differ = max(differ, abs(left - right))
        
        return max(left, right) + 1
    }
}
