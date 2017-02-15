//
//  CircleComponent.swift
//  NSDashboard
//
//  Created by José Eduardo Vieira Morango on 14/02/17.
//  Copyright © 2017 José Eduardo Vieira Morango. All rights reserved.
//

import UIKit

@IBDesignable
class CircleComponent: UIView {


    @IBInspectable var perc: CGFloat = 0{
        didSet{
            drawBackground()
        }
    }
        @IBInspectable var color: UIColor = UIColor.blue
    
    override func layoutSubviews() {
        super.layoutSubviews()
    
            drawBackground()
    }
    
    
    
    
    
     func drawBackground(){
    
    
        let shapeLayer = CAShapeLayer()
     
        shapeLayer.lineWidth = 1
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = UIColor.black.cgColor
     
        let path = UIBezierPath(arcCenter: CGPoint(x: self.frame.width/2   ,y: self.frame.height/2), radius: 60, startAngle: CGFloat(0), endAngle: CGFloat(M_PI * 2), clockwise: false)
        shapeLayer.path = path.cgPath
        

        
        let shapeLayerFill = CAShapeLayer()
        
        shapeLayerFill.lineWidth = 40
        shapeLayerFill.fillColor = UIColor.clear.cgColor
        shapeLayerFill.strokeColor = color.cgColor
        shapeLayerFill.strokeStart = 0.0
//        shapeLayerFill.strokeEnd = 10
        shapeLayerFill.strokeEnd = perc / 100
        
        
        let pathFill = UIBezierPath(arcCenter: CGPoint(x: self.frame.width/2   ,y: self.frame.height/2), radius: 40, startAngle: CGFloat(M_PI * 1.5), endAngle: CGFloat(M_PI * 3.5), clockwise: true)
        shapeLayerFill.path = pathFill.cgPath
      
        
        let shapeLayer2 = CAShapeLayer()
        
    
        
        shapeLayer2.lineWidth = 1
        shapeLayer2.fillColor = UIColor.white.cgColor
        shapeLayer2.strokeColor = UIColor.black.cgColor
        
        let path2 =  UIBezierPath(arcCenter: CGPoint(x: self.frame.width/2   ,y: self.frame.height/2), radius: 40 , startAngle: CGFloat(0), endAngle: CGFloat(M_PI * 2), clockwise: false)
        
        shapeLayer2.path = path2.cgPath
        
//        shapeLayer.addSublayer(shapeLayer2)
        
        shapeLayer.addSublayer(shapeLayerFill)
        shapeLayerFill.addSublayer(shapeLayer2)
        layer.addSublayer(shapeLayer)
    
    
    
    }


}
