//
//  Board.swift
//  tictactoe
//
//  Created by Huy Vo on 10/30/18.
//  Copyright © 2018 Huy Vo. All rights reserved.
//

import Foundation

class Board {
    
    private var boardState: BoardState = .nowinner
    private var matrix: [[CellState]]
    private var move: Int
    private let size: Int
    // This variable keep tracks of which turn it is 
    private var cellState: CellState
    
    init(size:Int = 3) {
        self.size = size
        self.cellState = .x
        self.move = 0
        self.matrix = Array(repeating: Array(repeating: .none,
                                             count: size),
                            count: size)
    }
    
    func reset(){
        self.boardState = .nowinner
        self.cellState = .x
        self.move = 0
        self.matrix = Array(repeating: Array(repeating: .none,
                                             count: size),
                            count: size)
    }
    
    func set(at x: Int, _ y :Int, completion: (BoardState, CellState) -> ()){
        
        
        if cellState == .none || self.matrix[x][y] != .none{
            return
        }
        move += 1
        
        self.matrix[x][y] = cellState
        
        if winner(x: x, y: y, state: cellState) {
       
            self.boardState = .winner
            completion(boardState, cellState)
            self.cellState = .none
            
        } // check if board is fulled up
        else if self.move == self.size * self.size{
            boardState = .draw
            completion(boardState, cellState)
            self.cellState = .none 
        }
        else{
            completion(boardState, cellState)
            next()
        }
        
    }
    
    private func winner(x: Int, y: Int, state: CellState) -> Bool{
        
        // check column
        for i in 0 ..< self.size {
            if self.matrix[x][i] != state {
                break
            }
            
            if i == size - 1 {
                return true
            }
        }
        // check row
        for i in 0 ..< size {
            
            if self.matrix[i][y] != state{
                break
            }
            
            if i == size - 1{
                return true
            }
        }
        // check diagonal
        if x == y {
            for i in 0 ..< size {
                if self.matrix[i][i] != state {
                    break
                }
                
                if i == size - 1 { 
                    return true
                }
            }
        }
        
        if x + y == size - 1 {
            
         
            for i in 0 ..< size {
                if self.matrix[i][(size - 1) - i] != state {
                    break
                }
                
                if i == size - 1{
                    
                    return true
                }
            }
        }
        
        return false
    }
    
   
    
    private func next() { 
        if cellState == .x {
            cellState = .o
        }else{
            cellState = .x
        }
    }
  
}
