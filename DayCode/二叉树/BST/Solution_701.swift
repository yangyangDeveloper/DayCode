//
//  Solution_701.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/22.
//

/*
   考察点： BST的插入模版
   找到空闲的位置插入
   if root == nil {
      插入
   }
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
