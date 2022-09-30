//
//  Solution_145.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/4.
//

// 145. 二叉树的后序遍历
class Solution_145 {
    // 后序遍历LRD   双栈实现  前序遍历 DLR变成 DRL 然后放到stack
    func postorderTraversal(_ root: TreeNode?) -> [Int] {
        guard root != nil else {
            return []
        }
        
        var stack = [TreeNode]()
        var stack2 = [TreeNode]()
        var res = [Int]()
        var cur = root
        
        stack.append(root!)
        while stack.count > 0 {
            
            var temp = stack.removeLast()
            stack2.append(temp)
            
            if let left = temp.left {
                stack.append(left)
            }
            if let right = temp.right {
                stack.append(right)
            }
        }
        
        while stack2.count > 2 {
            var temp = stack2.removeLast()
            res.append(temp.val)
        }
        return res
    }
    
    
    //  方法二 递归
    func postorderTraversal2(_ root: TreeNode?) -> [Int] {
        if root == nil {
            return []
        }
        var res = [Int]()
        postorder(root, &res)
        return res
    }
    
    func postorder(_ root: TreeNode?, _ res: inout [Int]) {
        if root == nil {
            return
        }
        postorder(root?.left, &res)
        postorder(root?.right, &res)
        res.append(root!.val)
    }
}
