//
//  Solution_101.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/6.
//

/*
  思路： 和leetcode100 相同的树类似
  迭代可以用BFS层序遍历 每一层的节点都求出来 然后用左右指针判断每一层是否对称
  递归前序遍历： 判断值是否相等  左子树和右子树
*/

// 101. 对称二叉树
class Solution_101 {
    func isSymmetric(_ root: TreeNode?) -> Bool {
         if root == nil {
             return false
         }
         return check(root?.left, root?.right)
     }

     func check(_ left: TreeNode?, _ right: TreeNode?) -> Bool {
         if left == nil || right == nil {
             return left === right
         }
         if left!.val != right!.val {
             return false
         }
         return check(left?.left, right?.right) && check(left?.right, right?.left)
     }
}
