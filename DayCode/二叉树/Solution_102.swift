//
//  Solution_102.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/8/1.
//

// 102. 二叉树的层序遍历
class Solution_102 {
    /*
      思路： BFS
      1、根节点入队列
      2、队列出 然后把左右孩子入队列
      3、按照入队的顺序一个个的出队
     */
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
