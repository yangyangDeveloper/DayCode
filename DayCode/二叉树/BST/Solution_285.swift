//
//  Solution_285.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/10/2.
//


/*
   考察点： 查找p.val的位置   比如700题
   如果p.right存在 那么p的后驱就是 right里面最小值
   如果p.right不存在 那么p的后驱就是 父节点
*/

class Solution_285 {
    func inorderSuccessor(_ root: TreeNode?, _ p: TreeNode?) -> TreeNode? {
        if root == nil {
            return nil
        }
        var target: TreeNode?
        
        if root!.val > p!.val {
            target = inorderSuccessor(root?.left, p) // 有可能有空
            if target == nil {
                target = root
            }
        }
        
        if root!.val < p!.val {
            target = inorderSuccessor(root?.right, p)
        }
        
        if root!.val == p!.val {
            // 有可能为空
            target = findSmall(root?.right)
        }
        return target
    }
    
    func findSmall(_ root: TreeNode?) -> TreeNode? {
        var root = root
        while root != nil && root?.left != nil {
            root = root?.left
        }
        return root
    }
}
