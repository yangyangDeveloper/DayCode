//
//  BST.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/22.
//


/*
 对数据结构的操作 无非就是 遍历 + 访问
 遍历就是找
 访问就是改
 
 1、BST遍历模版
 2、BST插入模版

*/

// 普通的二叉树遍历查询模版
func searchTreeNode(_ root: TreeNode?, _ target: Int) -> TreeNode? {
    if root == nil {
        return nil
    }
    
    if root!.val == target {
        return root
    }
    // 当前节点没有就递归寻找左右子树寻找
    let left = searchTreeNode(root?.left, target)
    let right = searchTreeNode(root?.right, target)
    
    return left == nil ? right : left
}

// BST遍历查找模版
func searchBST(_ root: TreeNode?, _ target: Int) -> TreeNode? {
    if root == nil {
        return nil
    }
    if root!.val == target {
        // 查找到了
        return root
    }
    // 如果没有找到 就去左右子树搜寻
    if root!.val > target {
        return searchBST(root?.left, target)
    }
    if root!.val < target {
        return searchBST(root?.right, target)
    }
    return root
}


// BST插入模版
func insertBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
    // 找到空的位置 插入
    if root == nil {
        return TreeNode(val)
    }
    
    // 去左子树寻找
    if root!.val > val {
        root?.left = insertBST(root?.left, val)
    }
    
    // 去右子树寻找
    if root!.val < val {
        root?.right = insertBST(root?.right, val)
    }    
    return root
}


// BST中删除一个数模版
func deleteBST(_ root: TreeNode?, _ key: Int) -> TreeNode? {
    if root?.val == key {
        // 找到了 删除
    } else if root!.val > key {
        // 去左子树找
        root?.left = deleteBST(root?.left, key)
    } else if root!.val < key {
        // 去右子树找
        root?.right = deleteBST(root?.right, key)
    }
    return root
}

/*
   删除操作分为3种情况
   1、无左右子树
   2、存在一个子树 可以是左 可以是右
   3、左右子树都存在 那么为了保证 bst的特性 就需要替换节点了
      而替换节点 就需要选择一个满足bst特性的节点 也就是以当前root作为根节点的 左子树最大 或者右子树最小 提取上来 替换当前节点
 */
// BST中删除详细模版
func deleteBST2(_ root: TreeNode?, _ key: Int) -> TreeNode? {
    var root = root
    
    if root?.val == key {
        
        // case1 如果他没有孩子 直接删除就行了
        if root?.left == nil && root?.right == nil {
            return nil
        }
        
        // case2 如果他有1个孩子 让他另外一个孩子补位置 提上来
        if root?.left == nil { return root?.right }
        if root?.right == nil {return root?.left }
        
        // case3 如果他有2个孩子
        // 1、找到右子树最小结点 或者 左子树最大节点
        var minnode  = getMinNode(root?.right)
        // 2、删除右子树最小的节点
        root?.right = deleteBST2(root?.right, minnode!.val)
        
        // 3、用找到的minnode 去替换当前root节点
        minnode?.left = root?.left
        minnode?.right = root?.right
        root = minnode
        
    } else if root!.val > key {
        // 去左子树找
        root?.left = deleteBST(root?.left, key)
    } else if root!.val < key {
        // 去右子树找
        root?.right = deleteBST(root?.right, key)
    }
    return root
}

// 最小值一定在一棵树的最左边
func getMinNode(_ root: TreeNode?) -> TreeNode? {
    var cur = root
    while cur?.left != nil {
        cur = cur?.left
    }
    return cur
}


