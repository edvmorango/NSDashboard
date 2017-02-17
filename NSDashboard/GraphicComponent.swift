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
    
    @IBInspectable
    var valuesAtTime : [Int] = [0,200,300,400,900]{
        didSet{
            drawBackground()
        }
    }
    
    
    var totalUsers : Int = 0 {didSet{
        if totalUsers > 0{
        drawBackground()
        }
        }}
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
       layer.sublayers = nil
    
        
        drawBackground()
    }
    
    
    
    
    func drawBackground(){
        
        let boxX = self.frame.width * 0.18
        let boxY = self.frame.height * 0.05
        
        let boxSize = CGSize(width: self.frame.width * 0.80   , height: self.frame.height * 0.75)
        let boxPosition = CGPoint(x: boxX, y: boxY)
        
        let boxLayer = CAShapeLayer()
      
        boxLayer.fillColor = UIColor.clear.cgColor
        boxLayer.strokeColor = UIColor.black.cgColor
        
        let boxPath = UIBezierPath(rect:  CGRect(origin: boxPosition , size: boxSize))
        boxLayer.path = boxPath.cgPath
            
        backgroundColor = color
        
        layer.addSublayer(boxLayer)
    
        let position = [5,4,3,2,1].map{ CGFloat($0)}
        let divisor = [0,1,2,3,4].map{ Double($0)/5 }
        
        for i in 0...4{
            
            let valor = CGFloat(self.frame.height * 0.75 * 0.2 * position[i] - boxY / 2 )
            
            let rect = CGRect(x: self.frame.width * 0.02, y: valor , width: self.frame.width * 0.15, height: self.frame.height * 0.06)
            
            let label = UILabel(frame: rect)
                label.text = "\( (Double(totalUsers)  *  divisor[i]).rounded()   )"
                label.textAlignment = .right
            
            label.font = UIFont.systemFont(ofSize: self.frame.height * 0.05)
            self.addSubview(label)
            
        }
        
        
        
        for i in 0...4{
            
            let rect = CGRect(x: boxX + boxY / 2 + self.frame.width * 0.8 * 0.2 * CGFloat(i)
                , y: self.frame.height * 0.8 , width: self.frame.height * 0.04, height: self.frame.height * 0.05)
        
            let label = UILabel(frame: rect)
            label.text = "\(Int(position[i]))"
            label.textAlignment = .center
            label.font = UIFont.systemFont(ofSize: self.frame.height * 0.05)
            label.numberOfLines = 0
            label.lineBreakMode = .byCharWrapping
            
            self.addSubview(label)
        
        }
        
        let line = CAShapeLayer()
        let linePath = UIBezierPath()
        
        let baseY = self.frame.height * 0.75
        var points: [CGPoint] = []
        
        for i in 0...4{
        
        let currentValue = CGFloat(valuesAtTime[i])
        let reduction =  self.frame.height * 0.75 *  currentValue / CGFloat(totalUsers)
        let point = CGPoint(x: boxX + boxY / 2 + self.frame.width * 0.8 * 0.2 * CGFloat(i), y: baseY   - reduction    )
        
        
            points.append(point)
       
            if i == 0{
        linePath.move(to: point)
            }else{
        linePath.addLine(to: point)
        
            }
        
        }
        
        line.path = linePath.cgPath
        line.strokeColor = UIColor.red.cgColor
        line.fillColor = UIColor.clear.cgColor
        line.lineWidth = 1
//        line.lineJoin = kCALineJoinRound
        self.layer.addSublayer(line)
    
    }
    
}
