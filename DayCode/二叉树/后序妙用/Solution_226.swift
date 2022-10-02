//
//  Solution_226.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/8/1.
//

/*
   考察点： 二叉树递归 分解问题  
   递归解法：
   回溯遍历思想 ： 能不能用遍历的思维去解决 就是定一个 traverse遍历每个节点，让每个节点的左右子树都反转就行了  前中后序都可以插入代码
   分解问题： 如何使用分解问题的思维接问题  动态规划拆分子问题思想  只能在后序位置插入代码
 
   非递归解法：  使用队列
   套用层序遍历的代码  加上反转的3行代码就行了 
*/

// 226 反转二叉树
class Solution_226 {
    
    // 动态规划思想 后序遍历插入
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        if root == nil {
            return nil
        }
        let leftnode = invertTree(root?.left)
        let rightnode = invertTree(root?.right)
        // 后序遍历 通过下层子树的返回值 反转左右子树
        root?.left = rightnode
        root?.right = leftnode
        return root
    }
    
    
    //  回溯思想 遍历解决问题 前序 中序 后序 都可以插入代码
    func invertTree2(_ root: TreeNode?) -> TreeNode? {
        if root == nil {
            return nil
        }
        // 前序位置插入代码
        var temp = root?.left
        root?.left = root?.right
        root?.right = temp
        // 递归遍历
        invertTree(root?.left)
        invertTree(root?.right)
        return root
    }
    
    
    // 使用队列解决
    // 套用层序遍历的模版  加上反转的3行代码就行了
    func invertTree3(_ root: TreeNode?) -> TreeNode? {
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
