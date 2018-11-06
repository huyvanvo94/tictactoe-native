//
//  CellView.swift
//  tictactoe
//
//  Created by Huy Vo on 10/30/18.
//  Copyright © 2018 Huy Vo. All rights reserved.
//

import UIKit
 

class CellView: UIView {
    
 
    
    let tagId = 1
 
    override init(frame: CGRect) {
        super.init(frame: frame)
        didLoad()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        didLoad()
    }
    
    func didLoad(){
        self.backgroundColor = .white
    }
    
    func draw(color: UIColor){
        self.backgroundColor = color 
    }
    
    override func addSubview(_ view: UIView) {

        
        print("i am called ")
        self.reset()

        view.tag = tagId
        super.addSubview(view)
    } 
    
   
    
    func reset(){ 
        //guard let piece = self.piece else { return }
      //  piece.doRemoveFromSuperView()
        
        if let v = self.viewWithTag(tagId){
            v.removeFromSuperview()
        }
 
    }
    
}
