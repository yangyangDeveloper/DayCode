//
//  Solution_1254.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/25.
//

/*
   考察点： 网格岛屿的遍历
   思考：  边界的淹了  然后剩下的就是内陆岛
 */

// 1254. 统计封闭岛屿的数目
class Solution_1254 {
    func closedIsland(_ grid: [[Int]]) -> Int {
        var grid = grid
        
        var res = 0
        var m = grid.count
        var n = grid[0].count
        
        // 淹没第一行 最后一行
        for j in 0..<n {
            // 第一行
            dfs(&grid, 0, j)
            // 最后一行
            dfs(&grid, m - 1, j)
        }
        
        // 淹没第一列 最后一列
        for i in 0..<m {
            dfs(&grid, i, 0)
            // 把靠右边的岛屿淹掉
            dfs(&grid, i, n - 1)
        }
        
        // 遍历 grid，剩下的岛屿都是封闭岛屿
        for i in 0..<m {
            for j in 0..<n {
                if grid[i][j] == 0 {
                    res += 1
                    dfs(&grid, i, j)
                }
            }
        }
  
    
        // 讲(i，j)周边淹没 注意本题是 1 是水  0是陆地
        func dfs(_ grid: inout [[Int]], _ i: Int, _ j: Int) {
            
            // 越界
            if i < 0 || i >= m || j < 0 || j >= n {
                return
            }
            
            // 是水
            if grid[i][j] == 1 {
                // 已经是海水了
                return
            }
            
            // 遍历过就淹没
            grid[i][j] = 1
            
            dfs(&grid, i - 1, j)
            dfs(&grid, i + 1, j)
            dfs(&grid, i, j - 1)
            dfs(&grid, i, j + 1)
            
        }
        
        return res
    }
    
 
}
