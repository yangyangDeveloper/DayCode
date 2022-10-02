//
//  Solution_110.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/6.
//

/*
   考察点： 二叉树后序妙用
   思路：
   对于每个节点，先算出来左右子树的最大高度，然后在后序遍历的位置根据左右子树的最大高度判断平衡性
*/


// 110. 平衡二叉树
class Solution {
    
    var differ = 0
    /*
     平衡二叉树定义：左右子树最大高度差<=1   空树是平衡树
    */
    func isBalanced(_ root: TreeNode?) -> Bool {
        if root == nil {
            return true
        }
        helper(root)
        return differ > 1 ? false : true
    }
    
    func helper(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        let left = helper(root?.left)
        let right = helper(root?.right)
        
        // 后序位置插入代码  和求树的最大直径一个道理
        // 在这里记录左右子树的最大高度差,用于后面判断是否为平衡树
        differ = max(differ, abs(left - right))
        
        return max(left, right) + 1
    }
}
