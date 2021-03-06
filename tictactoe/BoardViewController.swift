//
//  ViewController.swift
//  tictactoe
//
//  Created by Huy Vo on 10/30/18.
//  Copyright © 2018 Huy Vo. All rights reserved.
//

import UIKit

let n = 3

class BoardViewController: UIViewController {
    
    let board = Board(size: n)
    
    // Each cell view can be mapped into a 2d array
    // The key is the (x, y) of the cell view
    // The value is the (x,y) of the 2d array in board model
    var mapper: [Position: (Int, Int)] = [:]
    let boardView: BoardView = {
        
        let width = UIScreen.main.bounds.width
        let height = UIScreen.main.bounds.height
        let boardView = BoardView(frame: CGRect(x: 0, y: 0, width: width, height: width))
        boardView.center = CGPoint(x: width/2, y: height/2)
        return boardView
        
    }()
 
    override func viewDidLoad() { 
        super.viewDidLoad()
        
        self.view.addSubview(boardView)
        self.buildUI()
    }
    
    func buildUI(){
        
        let startBtn: UIButton = {
            let button = UIButton(frame: CGRect(x: self.view.frame.width/2 - 50, y: 50, width: 100, height: 30))
            button.backgroundColor = UIColor(red: 39/255.0, green: 174/255.0, blue: 96/255.0, alpha: 1.0)
            button.setTitle("New Game", for: .normal)
            button.addTarget(self, action: #selector(self.startButtonDidPressed(sender:)), for: .touchUpInside)
          
            return button
            
        }()
     
        self.view.addSubview(startBtn)
        
        // create board
        let width = self.boardView.frame.height
        let height = self.boardView.frame.width
        
        let cHeight = height / CGFloat(integerLiteral: n)
        let cWidth = width / CGFloat(integerLiteral: n)
        
        var x: CGFloat = 0
        var y: CGFloat = 0
        // Draw the cells and map to dictionary
        for i in 0 ..< n{
            
            for j in 0 ..< n {
                let frame = CGRect(x: x + 10.0, y: y + 10.0, width: cWidth - 20, height: cHeight - 20)
                
                let cell = CellView(frame: frame)
                let singleTap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.didTouch(gestureRecognizer:)))
                singleTap.numberOfTapsRequired = 1
                
                cell.addGestureRecognizer(singleTap)
                
                self.boardView.addSubview(cell)
                
                let p = Position(x: frame.origin.x, y: frame.origin.y)
                
                self.mapper[p] = (i, j)
             
                x = x + cWidth
            }
            
            x = 0
            y = y + cHeight
        }

        // Draw horizontal and vertical boarders
        for y in stride(from: cHeight, through: boardView.frame.height - cHeight, by: cHeight) {
            
            self.boardView.drawLine(frm: CGPoint(x: 0, y: y), to: CGPoint(x: self.boardView.frame.width, y: y))
            
            self.boardView.drawLine(frm: CGPoint(x: y, y: 0), to:
            
                CGPoint(x: y, y: self.boardView.frame.height))
        }
        
    }
 
    
    @objc func startButtonDidPressed(sender: UIButton!) {
        
        self.resetGame()
        
    }
    
    func resetGame(){
        
        self.board.reset()
        self.boardView.reset()
        
    }
    
    
    @objc func didTouch(gestureRecognizer: UITapGestureRecognizer) {
      
     
        let view = gestureRecognizer.view
    
        let loc = gestureRecognizer.location(in: view)
        guard let cellView = view?.hitTest(loc, with: nil) as? CellView,
              let pos = mapper[Position(x: cellView.frame.origin.x, y: cellView.frame.origin.y)]
              else { return }
        
        let x = pos.0
        let y = pos.1
          
        self.board.set(at: x, y) { boardState, cellState in
            
            if cellState == .x {
                let n: CGFloat = 20
                
                let xPiece = XPiece(frame: CGRect(x: n,
                                                  y: n,
                                                  width: cellView.frame.width - n,
                                                  height: cellView.frame.height - n))
                
                xPiece.center = CGPoint(x: cellView.frame.width/2,
                                        y: cellView.frame.height/2)
               
                cellView.addSubview(xPiece)
                
            }else{
                
                let n: CGFloat = 20
                let oPiece = OPiece(frame: CGRect(x: n,
                                                  y: n,
                                                  width: cellView.frame.width - n,
                                                  height: cellView.frame.height - n))
                oPiece.center = CGPoint(x: cellView.frame.width/2, y: cellView.frame.height/2)
              
                cellView.addSubview(oPiece)
            }
            
            
            if boardState == .winner {
                
                let msg: String = (cellState == .x) ? ( "Player one wins" )  : ( "Player two wins" )
                
                
                let alert = UIAlertController(title: "Winner",
                                              message: msg,
                                              preferredStyle: .alert)
                
                let action = UIAlertAction(title: "OK", style: .default) {
                    _ in
                    
                    self.resetGame()
                }
                
                alert.addAction(action)
                
                self.present(alert, animated: true)
                
                print("winner")
            }
            
            if boardState == .draw{
                let msg = "draw"
                
                let alert = UIAlertController(title: "Draw",
                                              message: msg,
                                              preferredStyle: .alert)
                
                let action = UIAlertAction(title: "OK", style: .default) {
                    _ in
                    
                    self.resetGame()
                }
                
                alert.addAction(action)
                
                self.present(alert, animated: true)
            }
        } 
    }
    
}

struct Position: Hashable {
    let x: CGFloat
    let y: CGFloat
    
    var hashValue: Int {
        return "(\(x),\(y))".hashValue
    }
    
    static func == (lhs: Position, rhs: Position) -> Bool {
        return lhs.x == rhs.x && lhs.y == rhs.y
    }
}

