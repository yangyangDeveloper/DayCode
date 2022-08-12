//
//  Solution_144.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/8/1.
//

// 144. 二叉树的前序遍历
class Solution_144 {
    // 方法一
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        guard root != nil else { return [] }
        var stack = [TreeNode]()
        stack.append(root!)
        var res = [Int]()
        while stack.count > 0 {
            let temp = stack.removeLast()
            res.append(temp.val)
            
            if let rightnode = temp.right {
                stack.append(rightnode)
            }
            
            if let leftnode = temp.left {
                stack.append(leftnode)
            }
        }
        return res
    }
    
    // 方法二 通用写法
    func preorderTraversal2(_ root: TreeNode?) -> [Int] {
        guard root != nil else { return [] }
        var stack = [TreeNode]()
        var curnode = root
        var res = [Int]()
        while curnode != nil || stack.count > 0 {
            while curnode != nil {
                stack.append(curnode!)
                res.append(curnode!.val)
                curnode = curnode?.left
            }
            curnode = stack.popLast()
            curnode = curnode?.right
        }
        return res
    }
}
