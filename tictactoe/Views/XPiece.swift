//
//  XPiece.swift
//  tictactoe
//
//  Created by Huy Vo on 11/3/18.
//  Copyright © 2018 Huy Vo. All rights reserved.
//

import UIKit

class XPiece: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        didLoad()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        didLoad()
    }
    
    func didLoad(){
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: self.frame.size.width, y: self.frame.size.height))
        path.move(to: CGPoint(x: 0, y: self.frame.size.height))
        path.addLine(to: CGPoint(x: self.frame.size.width, y: 0))
  
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        // RGB(205, 92, 92)
        shapeLayer.strokeColor = UIColor(red: 205/255.0, green: 92/255.0, blue: 92/255.0, alpha: 1.0).cgColor
        shapeLayer.lineWidth = 20
        self.layer.addSublayer(shapeLayer)

       // self.setNeedsDisplay()
    }
}

