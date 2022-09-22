//
//  Solution_98.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/6.
//

/*
 考察点： BST的性质  对于左子树 root一定是最大值 对于右子树 root一定是最小值
 思路：  递归中序遍历时候  可以传递 最大值 和 最小值，  然后判断 是否左边的值比 root 大   右边的值比 root 小   那就是非法
 
 
 */
// 98. 验证二叉搜索树
class Solution_98 {
    
    // 递归遍历
    func isValidBST3(_ root: TreeNode?) -> Bool {
        return isVavidHelper(root, nil, nil)
    }
    
    func isVavidHelper(_ root: TreeNode?, _ minvalue: TreeNode?, _ maxvalue: TreeNode?) -> Bool {
        if root == nil {
            return true
        }
        
        // root 为根的子树节点必须满足 max.val > root.val > min.val  也就是  min.val < root.val < max.val
        // 如果存在最小值 那就是右子树 那么root一定比这个大才对
        if minvalue != nil && root!.val <= minvalue!.val {
            return false
        }
        
        if maxvalue != nil && root!.val >= maxvalue!.val {
            return false
        }
        
        // 限定左子树的最大值是 root.val，右子树的最小值是 root.val
        let t1 = isVavidHelper(root?.left, minvalue, root)
        let t2 = isVavidHelper(root?.right, root, maxvalue)
        return t1 && t2
    }
    
    
    
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
