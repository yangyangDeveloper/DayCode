//
//  Solution_366.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/10/1.
//

/*
    考察点： 二叉树后序遍历妙用
    思路： 其实就是相同高度的节点放到一起
    获取当前节点距离叶子结点的高度

   1    --->  2
 2   3  --- > 1
*/


// 366. 寻找二叉树的叶子节点
class Solution_366 {

    var res = [[Int]]()
    func findLeaves(_ root: TreeNode?) -> [[Int]] {
        maxDepth(root)
        return res
    }

    func maxDepth(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        let t1 = maxDepth(root?.left)
        let t2 = maxDepth(root?.right)

        // 当前节点的最大深度 叶子结点为1   叶子节点左右子树为空
        var h = max(t1 , t2) + 1

        // print(t1)
        // print(t2)
        // print(h)

        if res.count < h {
            var level = [Int]()
            res.append(level)
        }
        print(res)
        print("h-1==\(h-1)")
        res[h-1].append(root!.val)
        print(res)
        return h

    }
}
