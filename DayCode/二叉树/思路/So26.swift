//
//  Solution_26.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/21.
//

/*
   考察点：递归分解
   思路： 如果B是A的子结构那么一定属于下面3中情况
   1、 B的根节点在 root上
   2、 B的根节点在 root的左子树上
   3、 B的根节点在 root的右子树上
   
   需要一个函数判断  两个子树是否相等
   if a 为空 一定是 返回false
   if b 为空 返回true
   if a ！= b  返回false
   依次比较所有节点
 */

// 剑指 Offer 26. 树的子结构
class So26 {
    func isSubStructure(_ A: TreeNode?, _ B: TreeNode?) -> Bool {
        if A == nil || B == nil {
            return false
        }
        var t1 = dfs(A, B)
        var t2 = isSubStructure(A?.left, B)
        var t3 = isSubStructure(A?.right, B)
        return t1 || t2 || t3
    }
    
    func dfs(_ a:TreeNode?, _ b: TreeNode?) -> Bool {
        // 允许 b走着没东西了 但是b存在时候 a必须存在
        if b == nil {
            return true
        }
        if a == nil {
            return false
        }
        if a?.val != b?.val {
            return false
        }
        
        return dfs(a?.left, b?.left) && dfs(a?.right, b?.right)
    }
}
