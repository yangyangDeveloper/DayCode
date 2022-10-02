//
//  Solution_701.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/22.
//

/*
   考察点： BST的插入
   如果要递归地插入或者删除二叉树节点，递归函数一定要有返回值，而且返回值要被正确的接收
*/

// 701. 二叉搜索树中的插入操作
class Solution_701 {
    
    func insertIntoBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        if root == nil {
            return TreeNode(root!.val)
        }
        if root!.val > val {
            root?.left = insertIntoBST(root?.left, val)
        }
        if root!.val < val {
            root?.right = insertIntoBST(root?.right, val)
        }
        return root
    }
}
