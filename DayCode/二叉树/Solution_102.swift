//
//  Solution_102.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/8/1.
//

// 102. 二叉树的层序遍历

class Solution_102 {
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        guard root != nil else { return [] }
        var ret = [[Int]]()
        var queue = [TreeNode]()
        queue.append(root!)
        while queue.count > 0 {
            var level = [Int]()
            let nums = queue.count
            
            for i in 0..<nums {
                var temp = queue.removeFirst()
                level.append(temp.val)
                
                if let leftnode = temp.left {
                    queue.append(leftnode)
                }
                
                if let rightnode = temp.right {
                    queue.append(rightnode)
                }
            }
            ret.append(level)
        }
        return ret
    }
}
