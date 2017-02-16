//
//  GraphicComponent.swift
//  NSDashboard
//
//  Created by José Eduardo Vieira Morango on 16/02/17.
//  Copyright © 2017 José Eduardo Vieira Morango. All rights reserved.
//

import UIKit


@IBDesignable
class GraphicComponent: UIView{

    
    @IBInspectable var color: UIColor = UIColor.blue{
        didSet{
            drawBackground()
        }
    }

    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        drawBackground()
    }
    
    
    func drawBackground(){

        let boxSize = CGSize(width: self.frame.width * 0.88   , height: self.frame.height * 0.75)
        let boxPosition = CGPoint(x: self.frame.width * 0.1, y: self.frame.height * 0.05)
        let boxLayer = CAShapeLayer()
      
        boxLayer.fillColor = UIColor.clear.cgColor
        boxLayer.strokeColor = UIColor.black.cgColor
        
        let boxPath = UIBezierPath(rect:  CGRect(origin: boxPosition , size: boxSize))
        boxLayer.path = boxPath.cgPath
            
        backgroundColor = color
        
        layer.addSublayer(boxLayer)
    
        
        
        
        
        
        
    
    }
    
    
    
    
    
    
    
    
}
