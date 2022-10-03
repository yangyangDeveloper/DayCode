//
//  Solution_695.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/25.
//

// 695. 岛屿的最大面积
class Solution_695 {

    /*
        边岛 内部岛 都属于岛屿
        1、不需要考虑边界
        2、遇到1时候 dfs遍历
        3、岛屿面积 1 + 上下左右
        4、最后求最大的岛屿面积
    */
    func maxAreaOfIsland(_ grid: [[Int]]) -> Int {
        let m = grid.count
        let n = grid[0].count
        var grid = grid
        var res = 0
        for i in 0..<m {
            for j in 0..<n {
                // 找最大的岛屿面积
                res = max(res, dfs(&grid, i, j))
            }
        }
        
        // 淹没与 (i, j) 相邻的陆地，并返回淹没的陆地面积
        func dfs(_ grid: inout [[Int]], _ i: Int, _ j: Int) -> Int {
            
            // 出边界
            if i<0 || j<0 || i >= m || j >= n {
                return 0
            }
            
            // 是海洋
            if grid[i][j] == 0 {
                return 0
            }
            
            grid[i][j] = 0
            
            return 1 + dfs(&grid, i - 1, j) + dfs(&grid, i + 1, j) + dfs(&grid, i, j - 1) + dfs(&grid, i, j + 1)
        }
        
        return res
    }
}
