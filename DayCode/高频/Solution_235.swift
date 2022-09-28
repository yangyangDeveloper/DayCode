//
//  Solution_235.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/6.
//

/*
   考察点：bst特性
    
 */
class Solution_235 {
     func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
         if root == nil || p == nil || q == nil {
             return nil
         }

         var ans = root

         // 继续往下走
         while (ans!.val - p!.val) * (ans!.val - q!.val)  > 0 {
             ans = ans!.val > p!.val ?  ans?.left : ans?.right
         }

         return ans
     }
}
