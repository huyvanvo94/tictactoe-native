//
//  BoardView.swift
//  tictactoe
//
//  Created by Huy Vo on 10/30/18.
//  Copyright © 2018 Huy Vo. All rights reserved.
//

import UIKit

class BoardView: UIView {
     
    override init(frame: CGRect) {
        super.init(frame: frame)
        didLoad() 
    }
     
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        didLoad()
    }
    
    func didLoad(){ 
        self.backgroundColor = UIColor(red: 39/255.0,
                                       green: 174/255.0,
                                       blue: 96/255.0,
                                       alpha: 1.0)
        
        
    }
    
    func drawLine(frm: CGPoint, to: CGPoint){
        let path = UIBezierPath()
        path.move(to: frm)
        path.addLine(to: to)
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
       
        shapeLayer.strokeColor = UIColor(red: 27/255.0,
                                         green: 155/255.0,
                                         blue: 102.0/255,
                                         alpha: 1).cgColor
        shapeLayer.lineWidth = 4
        self.layer.addSublayer(shapeLayer)

        
    }
    
    func reset(){
        for view in self.subviews{
            if view is CellView {
                let cell = view as! CellView
                cell.reset()
            }
        }
    }
}


