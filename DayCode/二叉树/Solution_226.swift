//
//  Solution_226.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/8/1.
//

// 226 反转二叉树
class Solution_226 {
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        guard root != nil else { return nil }
        var queue = [TreeNode]()
        queue.append(root!)
        
        while queue.count > 0 {
            let temp = queue.removeFirst()
            
            var node = temp.left
            temp.left = temp.right
            temp.right = node
            
            if temp.left != nil {
                queue.append(temp.left!)
            }
            if temp.right != nil {
                queue.append(temp.right!)
            }
        }
        
        return root
    }
}
