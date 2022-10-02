//
//  Solution_617.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/6.
//

/*
  考察点：
  1、递归遍历  遍历一遍就可以解决问题 遇到相同节点 累加值   遇到一个为空 直接补上另外一个
  2、也可以使用bfs 广度优先 + queues
 
 */
// 617. 合并二叉树

class Solution_617 {
    
    // 递归遍历
    func mergeTrees(_ root1: TreeNode?, _ root2: TreeNode?) -> TreeNode? {
         if root1 == nil {
             return root2
         }

         if root2 == nil {
             return root1
         }

         root1!.val += root2!.val

         root1?.left = mergeTrees(root1?.left, root2?.left)

         root1?.right = mergeTrees(root1?.right, root2?.right)

         return root1
     }
    
    
    // 
    func mergeTrees2(_ root1: TreeNode?, _ root2: TreeNode?) -> TreeNode? {
        
        if root1 == nil || root2 == nil {
            return root1 == nil ? root2 : root1
        }
        
        var queue = [TreeNode]()
        
        queue.append(root1!)
        queue.append(root2!)
        
        while queue.count > 0 {
            
            for i in 0..<queue.count {
                
                let t1 = queue.removeFirst()
                let t2 = queue.removeFirst()
                
                t1.val += t2.val
                
                // 操作左子树
                if t1.left != nil && t2.left != nil {
                    queue.append(t1.left!)
                    queue.append(t2.left!)
                }else if t1.left == nil {
                    t1.left = t2.left
                }
                
                
                if t1.right != nil && t2.right != nil {
                    queue.append(t1.right!)
                    queue.append(t2.right!)
                }else if t1.right == nil {
                    t1.right = t2.right
                }
                
                
            }
        
            // 记录step
        }
        
        return root1
    }
    
}
