//
//  Solution_111.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/23.
//

/*
   考察点： BFS
   
   思路： 找start到target的最短路径  start就是根节点 target就是叶子结点
   BFS 算法和 DFS（回溯）算法的一大区别就是，BFS 第一次搜索到的结果是最优的，这个得益于 BFS 算法的搜索逻辑
   
   while { 决定深度
      for 决定宽度
   }
   解法：
   1、 递归遍历思想
   2、递归动态规划思想(注意考虑子树为空情况)
   3、bfs解法
 */
// 111. 二叉树的最小深度
class Solution_111 {
    
    // 模版解法 找start到target的最短路径  start就是根节点 target就是叶子结点
    func minDepth(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        var queue = [TreeNode]()
        queue.append(root!)
        var depth = 1
        
        while queue.count > 0 {
            
            // 当前队列中的所有节点向四周扩散
            for i in 0..<queue.count {
                var cur = queue.removeFirst()
                // 判断是否到了边界
                if cur.left == nil && cur.right == nil {
                    return depth
                }
                
                // 将cur的相邻节点 加入队列
                if let left = cur.left {
                    queue.append(left)
                }
                if let right = cur.right {
                    queue.append(right)
                }
            }
            // 这里增加步数  更新深度
            depth += 1
        }
        return depth
    }

    
/*
   解法 1   递归   回溯思维
 // 记录最小深度
 var mindep = Int.max

 // 记录遍历到的节点的深度
 var depth = 0
 func minDepth(_ root: TreeNode?) -> Int {
     traverse(root)
     return depth
 }

 func traverse(_ root: TreeNode?)  {
     if root == nil {
         return
     }
     // 前序位置
     depth += 1
     // 到达叶子结点更新
     if root?.left == nil && root?.right == nil {
         mindep = min(depth, mindep)
     }
     traverse(root?.left)
     traverse(root?.right)
     // 后序位置
     depth -= 1
  }
 */
   
    /*
    // 递归解法  动态规划思想
    var minva = 0
    // 求最小深度时候 需要考虑子树为空  因为最小深度的定义是 根节点  到 叶子结点
    func minDepth(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        
        let left = minDepth(root?.left)
        let right = minDepth(root?.right)
        
        // 存在空节点 不参与比较
        if left == 0 || right == 0 {
            minva = 1 + right + left
        } else {
            minva = min(left, right) + 1
        }
        
        return minva
    }
     */

}

