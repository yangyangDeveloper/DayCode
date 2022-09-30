//
//  Solution_102.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/8/1.
//

/*
  考察点:  二叉树 BFS
*/

// 102. 二叉树的层序遍历
class Solution_102 {
    
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
         if root == nil {
             return []
         }
         var res = [[Int]]()
         var queue = [TreeNode]()
         queue.append(root!)
         var step = 0
         
         while queue.count > 0 {
             var level = [Int]()

             // 当前节点向四周扩展  二叉树是向下扩散 从左到右遍历  所以不需要考虑重复问题
             for i in 0..<queue.count  {
                 let temp = queue.removeFirst()
                 // 收集
                 level.append(temp.val)
                 // 这里不需要判断是否到达target
                 
                 // 相邻的节点装进队列  二叉树是把下一层放进去
                 if let left = temp.left {
                     // 二叉树不需要考虑重复
                     queue.append(left)
                 }

                 if let right = temp.right {
                     queue.append(right)
                 }
             }
             // 更新层数
             step += 1
             print(step)
             res.append(level)
         }
         return res
     }
}


