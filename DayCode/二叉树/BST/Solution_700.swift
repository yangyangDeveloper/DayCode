//
//  Solution_700.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/10/2.
//

/*
 
 考察点： BST 左小右大的特性，可以避免搜索整棵二叉树去寻找元素，从而提升效率
 */

// 700. 二叉搜索树中的搜索
class Solution_700 {
    func searchBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        if root == nil {
            return nil
        }
        // 去左子树搜索
        if root!.val > val {
            return searchBST(root?.left, val)
        }
        // 去右子树搜索
        if root!.val < val {
            return searchBST(root?.right, val)
        }
        return root
    }
}
