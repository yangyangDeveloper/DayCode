//
//  Solution_463.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/25.
//

/*
 
  考察点： 周长 = 边界的边数 + 遇到海洋的边数
 
 */
// 463. 岛屿的周长
class Solution_463 {
    func islandPerimeter(_ grid: [[Int]]) -> Int {
        let m = grid.count
        let n = grid[0].count
        var grid = grid
        if grid.count == 0 {
            return 0
        }
        
        for i in 0..<m {
            for j in 0..<n {
                if grid[i][j] == 1 {
                    //  题目限制只有一个岛屿，计算一个即可
                    return dfs(&grid, i , j)
                }
            }
        }
        
        // 周长 =  边界 + 海
        func dfs(_ grid: inout [[Int]], _ i: Int, _ j: Int) -> Int {
            
            // 函数因为「坐标 (r, c) 超出网格范围」返回，对应一条黄色的边
            if i < 0 || j < 0 || i >= m || j >= n {
                return 1
            }
            
            // 函数因为「当前格子是海洋格子」返回，对应一条蓝色的边
            if grid[i][j] == 0 {
                return 1
            }
            
            // 遍历过的设计为2
            grid[i][j] == 2
            
            return dfs(&grid, i - 1, j)  +   dfs(&grid, i + 1, j) + dfs(&grid, i, j - 1) + dfs(&grid, i, j + 1)
        }
        
        return 0
    }
    
    
    // 周长 =  边界 + 海
    func dfs2(_ grid: inout [[Int]], _ r: Int, _ c: Int) -> Int {
        
        let m = grid.count
        let n = grid[0].count
        
        // 函数因为「坐标 (r, c) 超出网格范围」返回，对应一条黄色的边
        if r < 0 || c < 0 || r >= m || c >= n {
            return 1
        }

        // 函数因为「当前格子是海洋格子」返回，对应一条蓝色的边
        if grid[r][c] == 0 {
            return 1
        }

        // 函数因为「当前格子是已遍历的陆地格子」返回，和周长没关系
        if grid[r][c] != 1 {
            return 0
        }

        // 遍历过
        grid[r][c] = 2
        
        return dfs(&grid,r - 1, c)  +  dfs(&grid,r + 1, c) + dfs(&grid, r, c - 1) + dfs(&grid, r, c + 1)
    }
}
