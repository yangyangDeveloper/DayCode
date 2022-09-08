//
//  So26.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/7.
//

// 剑指 Offer 26. 树的子结构
class So26 {
    // 时间复杂度 O(MN)   空间复杂度 O(M)
    func isSubStructure(_ A: TreeNode?, _ B: TreeNode?) -> Bool {
        if A == nil && B == nil {
            return false
        }
        // B为A的子结构有3种情况,满足任意一种即可:
        // 1.B的子结构起点为A的根节点,此时结果为helper(A,B)
        // 2.B的子结构起点隐藏在A的左子树中,而不是直接为A的根节点,此时结果为helper(A.left, B)
        // 3.B的子结构起点隐藏在A的右子树中,此时结果为helper(A.right, B)
        let t1 = helper(A, B)
        let t2 = isSubStructure(A?.left, B)
        let t3 = isSubStructure(A?.right, B)
        return t1 || t2 || t3
    }
    
    func helper(_ A: TreeNode?, _ B: TreeNode?) -> Bool {
        // 允许 b  走着没东西了   但是b存在时候 a必须存在
        if B == nil {
            return true
        }
        if A == nil {
            return false
        }
        if A?.val != B?.val {
            return false
        }
        let t1 = helper(A?.left, B?.left)
        let t2 = helper(A?.right, B?.right)
        
        return t1 && t2
    }
}
