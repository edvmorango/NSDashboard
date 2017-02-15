//
//  HorizontalComponent.swift
//  NSDashboard
//
//  Created by José Eduardo Vieira Morango on 15/02/17.
//  Copyright © 2017 José Eduardo Vieira Morango. All rights reserved.
//

import UIKit

@IBDesignable
class HorizontalComponent: UIView {

    
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
    
        
        let boxSize = CGSize(width: self.frame.width * 0.8   , height: self.frame.height * 0.4)
        let fillSize = CGSize(width: self.frame.width * 0.8  * perc / 100   , height: self.frame.height * 0.4)
        
        let beginPoint = CGPoint(x: self.frame.width * 0.1  , y: self.frame.height * 0.6)
        let infoSize = CGSize(width: self.frame.width * 0.8  * 0.22  , height: self.frame.height * 0.4)
        let infoPoint = CGPoint(x:  self.frame.width * 0.8  * perc / 100   , y: self.frame.height * 0.1)
        
        let boxLayer = CAShapeLayer()
        let fillLayer =  CAShapeLayer()
        
        boxLayer.lineWidth = 0.5
        boxLayer.fillColor = UIColor.clear.cgColor
        boxLayer.strokeColor = UIColor.black.cgColor
       
        fillLayer.lineWidth = 0
        fillLayer.fillColor = color.cgColor
        fillLayer.strokeColor = UIColor.clear.cgColor
        
        let fillPath = UIBezierPath(rect: CGRect(origin: beginPoint, size: fillSize ))
        let boxPath = UIBezierPath(rect: CGRect(origin: beginPoint, size: boxSize ))
        
        boxLayer.path = boxPath.cgPath
        fillLayer.path = fillPath.cgPath
        
        if perc > 0 {
        let infoView = UILabel(frame: CGRect(origin: infoPoint, size: infoSize))
        infoView.textAlignment = NSTextAlignment.center
        infoView.textColor = UIColor.black
        infoView.tintColor = UIColor.black
        infoView.font = UIFont.systemFont(ofSize: infoView.frame.height * 0.8)
        infoView.text = "\(perc)"
        self.bringSubview(toFront: infoView)
        addSubview(infoView)
        }
        
        boxLayer.addSublayer(fillLayer)
        layer.addSublayer(boxLayer)
        
    }
    
    
}
