//
//  Solution_450.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/22.
//

/*
    考察点: BST的删除模版
    
 */

// 450. 删除二叉搜索树中的节点
class Solution_450 {
    
    /*
     
    */
    // 题目要求返回 BST有可能会引用的节点
    func deleteNode(_ root: TreeNode?, _ key: Int) -> TreeNode? {
        var root = root
        
        if root == nil {
            return nil
        }
        
        if root?.val == key {
           // 找到删除元素
           // case1 、如果没有子节点
            if root?.left == nil && root?.right == nil {
                return nil
            }
            // case2、 存在一个子节点
            if root?.left == nil {
                return root?.right
            }
            if root?.right == nil {
                return root?.left
            }
            
            // case3、 两个节点都存在
            // 找到左子树最大节点 右子树最小节点 提升等级
            var minNode = getMinNode(root?.right)
            // 删除最小节点
            root?.right = deleteNode(root?.right, minNode!.val)
            
            // 给minnode装小弟
            minNode?.left = root?.left
            minNode?.right = root?.right
            // 取代新领导
            root = minNode

        }else if root!.val > key {
            root?.left = deleteNode(root?.left, key)
        }else if root!.val < key {
            root?.right = deleteNode(root?.right, key)
        }
        return root
    }
    
    // 获取最小的节点
    func getMinNode(_ root: TreeNode?) -> TreeNode? {
        var root = root
        while root?.left != nil {
            root = root?.left
        }
        return root
    }
}
