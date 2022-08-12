//
//  Solution_94.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/8/1.
//

// 94 二叉树的中序遍历
class Solution_94 {
   
    /*
     1、处理：将元素放进result数组中
     2、访问：遍历节点
     */
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        guard root != nil else { return [] }
        var res = [Int]()
        var stack = [TreeNode]()
        var curnode = root
        while curnode != nil || stack.count > 0 {
            while curnode != nil {
                stack.append(curnode!)
                curnode = curnode?.left
            }
            
            curnode = stack.removeLast()
            res.append(curnode!.val)
            curnode = curnode?.right
        }
        return res
    }
    
}



