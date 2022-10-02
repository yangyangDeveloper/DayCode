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
    // 通过一个辅助参数 确保左边所有特性都满足 < root   右边所有节点都满足  > root
    func isValidBST(_ root: TreeNode?) -> Bool {
       return isVlidBST(root, nil, nil)
    }

    // BST 要有 左子树左右包含孙子都必须比自己小
    func isVlidBST(_ root: TreeNode?, _ min: TreeNode?, _ max: TreeNode?) -> Bool {

        if root == nil {
            return true
        }

        // 左子树不合法 左子树的最大值不能大于max
        if max != nil && root!.val >= max!.val {
            return false
        }

        // 右子树不合法
        if min != nil && root!.val <= min!.val {
            return false
        }

        return isVlidBST(root?.left, min, root) && isVlidBST(root?.right, root, max)
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
    
    func isValidBST3(_ root: TreeNode?) -> Bool {
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
