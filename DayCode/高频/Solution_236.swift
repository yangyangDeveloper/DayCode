//
//  Solution_236.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/6.
//

// 236. 二叉树的最近公共祖先
class Solution_236 {
    
    // 递归
    // 如果root nil  root = p ｜｜ q   return root

    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
       if root == nil {
           return root
       }

       // 先序遍历，如果先找到了一个 那么另外一个一定在他下面 不需要遍历了
       // 在一侧
       if root === p || root === q {
           return root
       }

       // 往上传递
       let left = lowestCommonAncestor(root?.left,p,q)
       let right = lowestCommonAncestor(root?.right,p,q)
 
       // 后序位置 查找到了 root 的左边和右边刚好有 p 和 q  那root就是公共节点
       if left != nil && right != nil {
           return root
       }
       return left != nil ? left : right
    }
}
