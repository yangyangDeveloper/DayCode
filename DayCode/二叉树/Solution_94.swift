//
//  Solution_94.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/8/1.
//

// 94 二叉树的中序遍历
class Solution_94 {
   
    /*
        遍历遇到节点 不能访问 先放到栈内 回头访问栈左边 在访问他
     */
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        guard root != nil else { return [] }
        var res = [Int]()
        var stack = [TreeNode]()
        var curnode = root
        while curnode != nil || stack.count > 0 {
            if curnode != nil {
                stack.append(curnode!)
                curnode = curnode?.left
            }else {
                curnode = stack.removeLast()
                res.append(curnode!.val)
                curnode = curnode?.right
            }
        }
        return res
    }
    
}



