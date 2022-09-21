//
//  Solution_102.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/8/1.
//

/*
   考察点： 二叉树的层序遍历
   思想： while 对应 从上到下   for循环对应从左到右 遍历过程中 加入到下一层
   算法模版框架：
     func levelOrder2(_ root: TreeNode?) {
         if root == nil {
             return []
         }
         var queue = [TreeNode]()
         queue.append(root!)
         
         // 从上到下遍历二叉树的每一层
         while queue.count > 0 {
             // 从左到右遍历每一层的每一个节点
             for i in 0..<queue.count {
                 var temp = queue.removeFirst()
                 
                 // 将下一层放入queue
                 if let left = temp.left {
                     queue.append(left)
                 }
                 if let right = temp.right {
                     queue.append(right)
                 }
             }
         }
     }
*/

// 102. 二叉树的层序遍历
class Solution_102 {
    
    /*
      思路： BFS
      1、while 循环 从上往下 一层一层
      2、for 循环 从左到右
      3、for 循环时候  左右节点加入到下一层
      */
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        if root == nil {
            return []
        }
        var res = [[Int]]()
        var queue = [TreeNode]()
        queue.append(root!)
        
        // 从上到下遍历二叉树的每一层
        while queue.count > 0 {
            var level = [Int]()
            
            // 从左到右遍历每一层的每一个节点
            for i in 0..<queue.count {
                
                var temp = queue.removeFirst()
                level.append(temp.val)
                
                // 将下一层放入queue
                if let left = temp.left {
                    queue.append(left)
                }
                if let right = temp.right {
                    queue.append(right)
                }
            }
            res.append(level)
        }
        return res
    }
}


