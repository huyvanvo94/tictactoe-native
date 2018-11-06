//
//  YPiece.swift
//  tictactoe
//
//  Created by Huy Vo on 11/3/18.
//  Copyright © 2018 Huy Vo. All rights reserved.
//

import UIKit

class OPiece: UIView {

    private let pi = Double.pi
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        didLoad()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        didLoad()
    }
    
    func didLoad(){
  
        let bezierPath = UIBezierPath()
        
        bezierPath.addArc(withCenter: CGPoint(x: self.frame.width/2, y: self.frame.height/2),
                                     radius: self.frame.width/2,
                                     startAngle: 0,
                                     endAngle: CGFloat( 2 * pi ),
                                     clockwise: true)
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = bezierPath.cgPath
        shapeLayer.fillColor = self.superview?.backgroundColor?.cgColor
        // 69, 69, 69
        shapeLayer.strokeColor = UIColor(red: 69/255.0, green: 69/255.0, blue: 69/255.0, alpha: 1.0).cgColor
        shapeLayer.lineWidth = 20
        self.layer.addSublayer(shapeLayer)
        
        
    }

}
 
