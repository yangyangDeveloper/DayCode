//
//  Solution_230.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/22.
//

/*
 
    考察点： BST的中序遍历特性
    思路： 如果是常规的中序遍历 是增序
     
    traverse(root?.left)
    // 增序
    traverse(root?.right)


    traverse(root?.right)
    // 降序
    traverse(root?.left)

*/

class Solution_230 {
    
    var rank = 0
    var res  = 0
    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        traverse(root, k)
        return res
    }
    
    func traverse(_ root: TreeNode?, _ k: Int) {
        
        if root == nil {
            return
        }
        
        traverse(root?.left, k)
        // 中序遍历
        rank += 1
        if rank == k {
            res = root!.val
        }
        traverse(root?.right, k)
    }
}
