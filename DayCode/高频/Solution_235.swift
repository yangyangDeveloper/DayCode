//
//  Solution_235.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/6.
//

/*
   考察点：bst特性
  一旦发现 p 和 q 在当前节点的两侧，说明当前节点就是 LCA
  如果 p 和 q 都比当前节点小，那么显然 p 和 q 都在左子树，那么 LCA 在左子树。
  如果 p 和 q 都比当前节点大，那么显然 p 和 q 都在右子树，那么 LCA 在右子树。
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
    
    
    func lowestCommonAncestor2(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        guard let root = root, let q = q, let p = p  else {
            return nil
        }
        
        if (p.val > q.val) {
            // 交换一下 p q  为了 保证 p.val <= q.val，便于后续情况讨论
            return lowestCommonAncestor(root, q, p);
        }
       
        // 在中间 或者 root本身 = p 或者 q
        // 在中间
        // root = p  <  q
        // p < root = q
        if root.val >= p.val && root.val <= q.val {
            // p <= root <= q
            // 即 p 和 q 分别在 root 的左右子树，那么 root 就是 LCA
            return root;
        }
        
        if (root.val > q.val) {
            // p 和 q 都在 root 的左子树，那么 LCA 在左子树
            return lowestCommonAncestor(root.left, p, q);
        }
        
        else {
            // p 和 q 都在 root 的右子树，那么 LCA 在右子树
            return lowestCommonAncestor(root.right, p, q);
        }
    }
    
}
