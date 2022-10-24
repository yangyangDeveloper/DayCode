//
//  Solution_236.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/6.
//

// 236. 二叉树的最近公共祖先
class Solution_236 {
    
//    class TreeNode {
//        var left: TreeNode?
//        var right: TreeNode?
//        var val: Int
//        init(_ val: Int) {
//            self.val = val
//        }
//    }
//
//    var root = TreeNode(1)
//    var left = TreeNode(2)
//    var right = TreeNode(3)
//    var left2 = TreeNode(4)
//    var righ2 = TreeNode(5)
//
//    root.left = left
//    root.right = right
//    root.left?.left = left2
//    root.left?.right = right2
    
    // let t = s.lowestCommonAncestor(root, left, right2)
    
    
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
       if root == nil {
           return root
       }

       // 先序遍历，如果先找到了一个 那么另外一个一定在他下面 不需要遍历了
       // 在一侧
       if root === p || root === q {
           return root
       }

       // 从底往上传递
       let left = lowestCommonAncestor(root?.left,p,q)
       let right = lowestCommonAncestor(root?.right,p,q)
 
       // 后序位置 查找到了 root 的左边和右边刚好有 p 和 q  那root就是公共节点
       if left != nil && right != nil {
           return root
       }
        // 情况 2
       if left == nil && right == nil {
            return nil
       }
       return left != nil ? left : right
    }
}

/*

 func createTree(_ arr: [Int?]) -> TreeNode? {
    var arr = arr
     print("arr= \(arr)")
     var queue = [TreeNode?]()
     guard let rootv = arr.removeFirst() else {
         return nil
     }
     let root: TreeNode? = TreeNode(rootv)
     
     queue.append(root)
    
     while !arr.isEmpty {
         let temp = queue.removeFirst()
         if  temp != nil {
 
             if arr.count > 0,  let leftv = arr.removeFirst() {
                 let left = TreeNode(leftv)
                 temp?.left = left
                 queue.append(left)
             }
             if  arr.count > 0, let rightv = arr.removeFirst()  {
                 let right = TreeNode(rightv)
                 temp?.right = right
                 queue.append(temp)
             }
         }
     }
 
     return root
 }
 */
