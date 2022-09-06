//
//  Solution_98.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/6.
//

// 98. 验证二叉搜索树
class Solution_98 {
    
    func isValidBST(_ root: TreeNode?) -> Bool {
        guard root != nil else { return true }
        var stack = [TreeNode]()
        var cur = root
        var pre = root
        while cur != nil || stack.count > 0 {
            if cur != nil {
                stack.append(cur!)
                cur = cur!.left
            }
            else {
                cur = stack.removeLast()
                // 中序遍历得到的节点的值 如果小于等于前一个 inorder 那就不是BST
                if pre != nil &&  pre!.val >= cur!.val {
                    return false
                }
                pre = cur
                cur = cur!.right
            }
         
        }
        return true
    }
    
    func isValidBST2(_ root: TreeNode?) -> Bool {
        guard root != nil else { return true }
        var stack = [TreeNode]()
        var cur = root
        var pre = root
        while cur != nil || stack.count > 0 {
            if cur != nil {
                stack.append(cur!)
                cur = cur!.left
            } else {
                cur = stack.removeLast()
                if pre != nil && pre!.val >= cur!.val {
                    return false
                }
                pre = cur
                cur = cur!.right
            }
        }
        return true
    }
}
