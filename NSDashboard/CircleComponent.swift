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
    
        let middlePoint = CGPoint(x: self.frame.width/2   ,y: self.frame.height/2)
        let greaterRadius = (self.frame.width + self.frame.height) / 7
        let minorRadius = (self.frame.width + self.frame.height) / 10
       
        let width : CGFloat = 1
        let fillWidth = (greaterRadius - minorRadius) * 2
        
        let shapeLayer = CAShapeLayer()
        let shapeLayerFill = CAShapeLayer()
        let shapeLayerFinal = CAShapeLayer()
       
        shapeLayer.lineWidth = width
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = UIColor.black.cgColor
     
        shapeLayerFill.lineWidth =  fillWidth
        shapeLayerFill.fillColor = UIColor.clear.cgColor
        shapeLayerFill.strokeColor = color.cgColor
        shapeLayerFill.strokeStart = 0.0
        shapeLayerFill.strokeEnd =   perc > 0 ?  perc / 100 : 0
    
        shapeLayerFinal.lineWidth = width
        shapeLayerFinal.fillColor = UIColor.white.cgColor
        shapeLayerFinal.strokeColor = UIColor.black.cgColor
   
        
        let path = UIBezierPath(arcCenter: middlePoint, radius: greaterRadius, startAngle: CGFloat(0), endAngle: CGFloat(M_PI * 2), clockwise: false)
        let pathFill = UIBezierPath(arcCenter: middlePoint, radius: minorRadius, startAngle: CGFloat(M_PI * 1.5), endAngle: CGFloat(M_PI * 3.5), clockwise: true)
        let pathFinal =  UIBezierPath(arcCenter: middlePoint, radius: minorRadius , startAngle: CGFloat(0), endAngle: CGFloat(M_PI * 2), clockwise: false)
        
        shapeLayer.path = path.cgPath
        shapeLayerFill.path = pathFill.cgPath
        shapeLayerFinal.path = pathFinal.cgPath
        
        shapeLayer.addSublayer(shapeLayerFill)
        shapeLayerFill.addSublayer(shapeLayerFinal)
        layer.addSublayer(shapeLayer)
        
        let textView = UITextView(frame: CGRect(x: self.frame.width/2 - minorRadius/2, y: self.frame.height/2 - minorRadius/3, width: minorRadius, height: minorRadius/2 ))
        
        
        textView.text = "\(perc)%"
        textView.textAlignment = NSTextAlignment.center
        textView.textColor = UIColor.black
        textView.tintColor = UIColor.black
        textView.font = UIFont.systemFont(ofSize: textView.frame.height * 0.6)
        bringSubview(toFront: textView)

        self.addSubview(textView)
      
        
        
        
        
    
    
    }


}
