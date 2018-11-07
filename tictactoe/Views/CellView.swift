//
//  CellView.swift
//  tictactoe
//
//  Created by Huy Vo on 10/30/18.
//  Copyright © 2018 Huy Vo. All rights reserved.
//

import UIKit
 
/*
 Cell is each cell in a NxN tic tac toe game.
 */
class CellView: UIView {
    
    private let tagID = 1
 
    override init(frame: CGRect) {
        super.init(frame: frame)
        didLoad()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        didLoad()
    }
    
    func didLoad(){
        self.backgroundColor = self.superview?.backgroundColor
    }
    
 
    // The side effect of this function makes sure
    // that each cell only has one piece at a time.
    override func addSubview(_ view: UIView) {
        
        self.reset()

        view.tag = self.tagID
        super.addSubview(view)
    }
    
    
    func reset(){ 
   
        if let v = self.viewWithTag(tagID){
            v.removeFromSuperview()
        }
 
    }
    
}
