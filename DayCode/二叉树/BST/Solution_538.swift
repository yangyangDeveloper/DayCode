//
//  Solution_538.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/22.
//

/*
   考察点： BST的中序遍历特性  可以升序 可以降序
*/

// 538. 把二叉搜索树转换为累加树
class Solution_538 {
    
    var sum = 0
    func convertBST(_ root: TreeNode?) -> TreeNode? {
        traverse(root)
        return root
    }

    func traverse(_ root: TreeNode?) {
        if root == nil {
            return
        }
        
        traverse(root?.right)
        // 中序遍历
        sum += root!.val
        root?.val = sum
        traverse(root?.left)
    }
}
