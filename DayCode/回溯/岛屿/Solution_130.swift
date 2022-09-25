//
//  Solution_130.swift
//  DayCode
//
//  Created by zhangyangyang on 2022/9/25.
//

/*
 
   考察点： 回溯岛屿问题
   思考：  先找到一周边界里面的 o  给替换成 A
   第二次 if 遇到了a 那就变成0   其他的o变成 x
   说白了就是先把 边界的o仍一遍 用一个n 来标志  然后把其他的o 都变成x 之后 再回来吧n 变成 o   边界o和内陆o不一样
*/

// 130. 被围绕的区域
class Solution_130 {
    
    func solve(_ board: inout [[Character]]) {
        let m = board.count
        let n = board[0].count
        var borad = board
        
        // board[i][0]  board[i][n-1]
        for i in 0..<m {
            dfs(&board, i, 0)
            dfs(&board, i, n - 1)
        }
        
        // board[0][j] board[m-1][j]
        for j in 0..<n {
            dfs(&board, 0, j)
            dfs(&board, m-1, j)
        }
        
        for i in 0..<m {
            for j in 0..<n {
                if board[i][j] == "O" {
                    board[i][j] = "X"
                } else if board[i][j] == "N" {
                    board[i][j] = "O"
                }
            }
        }
        
        func dfs(_ board: inout [[Character]], _ i: Int, _ j: Int) {
            
            //  注意 base case  只找"O"  其他的遇到什么都不做
            if i < 0 || j < 0 || i >= m || j >= n || board[i][j] != "O" {
                 return
            }
            
            // 只找边界里面的O
            if board[i][j] == "X" {
                return
            }
            
            board[i][j] = "N"
            
            dfs(&board, i - 1, j)
            dfs(&board, i + 1, j)
            dfs(&board, i, j - 1)
            dfs(&board, i, j + 1)
        }
    }
}
