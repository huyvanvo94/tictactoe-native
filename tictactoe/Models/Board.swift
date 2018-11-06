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
    
    var state: CellState
    
    init(size:Int = 3) {
        self.size = size
        self.state = .x
        self.move = 0
        self.matrix = Array(repeating: Array(repeating: .none,
                                             count: size),
                            count: size)
    }
    
    func reset(){
        self.boardState = .nowinner
        self.state = .x
        self.move = 0
        self.matrix = Array(repeating: Array(repeating: .none,
                                             count: size),
                            count: size)
    }
    
    func set(at x: Int, _ y :Int, completion: (BoardState, CellState) -> ()){
        
        
        if state == .none || self.matrix[x][y] != .none{
            return
        }
        move += 1
        
        self.matrix[x][y] = state
        
        if winner(x: x, y: y, state: state) {
       
            self.boardState = .winner
            completion(boardState, state)
            self.state = .none
            
        }
        else if self.move == self.size * self.size{
            boardState = .draw
            completion(boardState, state)
            self.state = .none 
        }
        
        else{
            completion(boardState, state)
            next()
        }
        
    }
    
    private func winner(x: Int, y: Int, state: CellState) -> Bool{
        
        for i in 0 ..< self.size {
            if self.matrix[x][i] != state {
                break
            }
            
            if i == size - 1 {
                return true
            }
        }
        
        for i in 0 ..< size {
            
            if self.matrix[i][y] != state{
                break
            }
            
            if i == size - 1{
                return true
            }
        }
        
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
    
   
    
    func next() { 
        if state == .x {
            state = .o
        }else{
            state = .x
        }
    }
  
}
