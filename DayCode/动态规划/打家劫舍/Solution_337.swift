//
//  Solution_337.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/26.
//

import Darwin

/*
   //递归思想（不要深入递归函数体，只需知道递归函数的功能，以及找到跳出递归的边界条件）
   考察点： 抢或者不抢 遍历二叉树
 
   每个节点都会出现偷和不偷两种情况:(偷，不偷)
 //能盗取的最高金额为 抢劫该节点+抢劫该节点的左孩子的左右子树+抢劫该节点的右孩子的左右子树
    //与 抢劫该节点的左子树+抢劫该节点的右子树的和  的最大值
 */

// 337. 打家劫舍 III
class Solution_337 {
    func rob(_ root: TreeNode?) -> Int {
        let result = dfs(root)
        return max(result[0], result[1])
    }
    
    // 定义一个数组res,长度为2,res[0]表示不抢该节点可获得最大值,res[1]表示抢劫该节点可获得最大值
    // dfs(r)意为：在以r为根节点的树中,返回抢劫根节点与不抢劫根节点可获得的最大值
    func dfs(_ root: TreeNode?) -> [Int] {
        if root == nil {
            return [0,0]
        }
        var result = [Int](repeating: 0, count: 2)
        let left = dfs(root?.left)
        let right = dfs(root?.right)
        
        // 后序遍历插入代码
        // 不偷
        result[0] = max(left[0], left[1]) + max(right[0], right[1]) // 计算不抢劫当前根节点可获得的最大金额
        
        // 偷这个节点
        result[1] = left[0] + right[0]  + root!.val
        
        return result
    }

}
