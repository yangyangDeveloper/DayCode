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
   
   // a为根节点的 剩下的需要相同
   if a.val== b.val && compare(a,b) {
        return  true
   }
   
   否者就不能以a为根节点判断  需要判断其他
   return isubtr(a.left.b) || issub(a.right, b)
 */

// 剑指 Offer 26. 树的子结构
class So26 {
    // 遍历一遍解决问题
    func isSubStructure(_ A: TreeNode?, _ B: TreeNode?) -> Bool {
        let a = A
        let b = B
        // 约定空树不是任意一个树的子结构)
        // 还没遇到相等 就出现空的
        if a == nil || b == nil {
            return false
        }
        // 树a的一个节点
        // 如果a.val == b.val 则a可以作为根节点尝试去匹配树
        if a!.val == b!.val && compareTree(a,b) {
            return true
        }

        // 如果a.vale != b.val  就不要去匹配B树了
        return isSubStructure(a?.left, b) || isSubStructure(a?.right, b)
    }


    // 通过分解问题的思路理解
    // 返回a开始是否可以完全匹配 b树上的所有节点
    func compareTree(_ a: TreeNode?, _ b: TreeNode?) -> Bool {
        // base case

        // b 为空可以  如果是子树就不行 子结构可以
        // 子树要求 同时为空 才可以   子结构允许 b为空
        if b == nil {
            return true
        }

        // a 没有东西 但是b 有东西  那一定不是子结构
        if a == nil && b != nil {
            return false
        }

        if a!.val != b!.val {
            return false
        }

        // a的值和b的值匹配完成 去匹配子树的节点
        return compareTree(a?.left, b?.left) && compareTree(a?.right, b?.right)
    }
}
