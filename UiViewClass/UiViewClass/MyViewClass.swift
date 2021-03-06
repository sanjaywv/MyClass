//
//  MyViewClass.swift
//  UiViewClass
//
//  Created by WV-Mac4 on 15/09/20.
//  Copyright © 2020 Mac-4. All rights reserved.
//



import Foundation
import UIKit

extension UIView {
    func drawDottedLine() {
        let shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = UIColor.black.cgColor
        shapeLayer.lineWidth = 1
        shapeLayer.lineDashPattern = [1, 1]
        
        let path = CGMutablePath()
        path.addLines(between: [CGPoint(x: 0, y: 0), CGPoint(x: 0, y: self.frame.size.height)])
        shapeLayer.path = path
        self.layer.addSublayer(shapeLayer)
    }
}
@IBDesignable class UIViewClass: UIView {
    
    var left : CGFloat!
    var right : CGFloat!
    var top : CGFloat!
    var buttom : CGFloat!
    let gradientLayer = CAGradientLayer()
    

 
    @IBInspectable var shadow: Bool = false {
        
        didSet {
            if shadow{
                 self.addShadow(shadowColor: shadowColor.cgColor, shadowOffset: shadowOffSet, shadowOpacity: shadowOpacity, shadowRadius: shadowRadious)
            }
        }
    }
    
    @IBInspectable var shadowOpacity: Float = 0.1 {
        didSet{
            //layer.shadowOpacity = shadowOpacity
             self.addShadow(shadowColor: shadowColor.cgColor, shadowOffset: shadowOffSet, shadowOpacity: shadowOpacity, shadowRadius: shadowRadious)
            
        }
    }
    
    @IBInspectable var shadowColor: UIColor = UIColor.black {
        didSet{
           // layer.shadowColor = shadowColor.cgColor
             self.addShadow(shadowColor: shadowColor.cgColor, shadowOffset: shadowOffSet, shadowOpacity: shadowOpacity, shadowRadius: shadowRadious)
            
        }
    }
    @IBInspectable var topLeftRight: CGFloat = 0.0 {
           didSet{
            self.leftRight()
           }
       }
    @IBInspectable var shadowOffSet: CGSize = CGSize(width: 1, height: 1) {
        didSet{
           // layer.shadowOffset = shadowOffSet
             self.addShadow(shadowColor: shadowColor.cgColor, shadowOffset: shadowOffSet, shadowOpacity: shadowOpacity, shadowRadius: shadowRadious)
            
        }
        
    }
    
    @IBInspectable var shadowRadious: CGFloat = 2.0 {
        didSet{
           self.addShadow(shadowColor: shadowColor.cgColor, shadowOffset: shadowOffSet, shadowOpacity: shadowOpacity, shadowRadius: shadowRadious)
            
        }
        
    }
    
    

    
    //MARK: Border color
    @IBInspectable var borderColorCode: UIColor = UIColor.clear  {
        didSet {
            self.layer.borderColor = borderColorCode.cgColor
        }
    }
    
    
    //MARK: Border width
    @IBInspectable var borderWidth: CGFloat = 0.0 {
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }
    @IBInspectable var makeItBound: Bool = false {
        didSet {
            
        }
    }
    //Mark: - Corner radious
    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    // padding left :
    @IBInspectable var firstBackgroundColor: UIColor = UIColor.clear {
        didSet {
            createBlueGreenGradient()
        }
    }
    
    // padding left :
    @IBInspectable var secoandBackgroundColor: UIColor = UIColor.clear {
        didSet {
            createBlueGreenGradient()
        }
    }
    
    override func layoutSubviews() {
        gradientLayer.frame = self.bounds
    }
    func leftRight()
    {
        self.layer.cornerRadius = topLeftRight
        self.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    
    func createBlueGreenGradient(){
        self.autoresizingMask = UIView.AutoresizingMask(rawValue: UIView.AutoresizingMask.RawValue(UInt8(UIView.AutoresizingMask.flexibleWidth.rawValue) | UInt8(UIView.AutoresizingMask.flexibleHeight.rawValue)))
        
        if firstBackgroundColor == UIColor.clear && secoandBackgroundColor == UIColor.clear {
            self.backgroundColor = UIColor.clear
            
        }else if firstBackgroundColor == UIColor.clear || secoandBackgroundColor == UIColor.clear{
            
            if firstBackgroundColor == UIColor.clear {
                
                self.backgroundColor = UIColor.clear
                //  self.layer.sublayers?.remove(at: 0)
                self.layer.insertSublayer(gradientFrom(firstcolor: secoandBackgroundColor , secandColor: secoandBackgroundColor), at: 0)
                
            }else if secoandBackgroundColor == UIColor.clear {

                self.backgroundColor = UIColor.clear
                //  self.layer.sublayers?.remove(at: 0)
                self.layer.insertSublayer(gradientFrom(firstcolor: firstBackgroundColor , secandColor: firstBackgroundColor), at: 0)
            }
        }else{
            self.backgroundColor = UIColor.clear
            //  self.layer.sublayers?.remove(at: 0)
            self.layer.insertSublayer(gradientFrom(firstcolor: firstBackgroundColor , secandColor: secoandBackgroundColor), at: 0)
        }
    }
    
    func gradientFrom(firstcolor : UIColor, secandColor  : UIColor )-> CAGradientLayer{
        let topColor =   firstcolor.cgColor  //UIColor(red: 220/255.0, green: 60/255.0, blue: 20/255.0, alpha: 1).cgColor
        let bottomColor =  secandColor.cgColor//UIColor(red: 255/255.0, green: 255/255.0, blue: 102/255.0, alpha: 1).cgColor
        let gradientColors = [topColor, bottomColor]
        let gradientLocations: [NSNumber] = [0.0, 2.0]
        
        gradientLayer.colors = gradientColors
        gradientLayer.locations = gradientLocations
        gradientLayer.cornerRadius = cornerRadius
        
        gradientLayer.shadowOpacity = shadowOpacity
        gradientLayer.shadowOffset = shadowOffSet
        gradientLayer.shadowRadius = shadowRadious
        gradientLayer.shadowColor = shadowColor.cgColor
     
        //Set startPoint and endPoint property also
        //        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
        //        gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
        gradientLayer.frame =  CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height)
        return gradientLayer
    }
    
    
    /*--------------------------------------------------------------------------------------------------*/
    
    // MARK: - View
    override func awakeFromNib() {
        self.setupView()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        self.setupView()
    }
    
    func setupView() {
        self.layer.cornerRadius = cornerRadius
      //  self.layer.masksToBounds = true
        self.clipsToBounds  = makeItBound
//        firstBackgroundColor = UIColor.white

        createBlueGreenGradient()
        self.layer.cornerRadius = topLeftRight
        self.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        self.setNeedsLayout()
        self.setNeedsDisplay()
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
    }
    
    
    func addShadow(shadowColor: CGColor,
                   shadowOffset: CGSize ,
                   shadowOpacity: Float ,
                   shadowRadius: CGFloat) {
        
        layer.shadowOpacity = shadowOpacity
        layer.shadowOffset = shadowOffset
        layer.shadowRadius = shadowRadius
        layer.shadowColor = shadowColor

    }
}

// rounded only upper corner : -
extension UIView {
    
    func roundCorners(corners:UIRectCorner, radius: CGFloat) {
        
        DispatchQueue.main.async {
            let path = UIBezierPath(roundedRect: self.bounds,
                                    byRoundingCorners: corners,
                                    cornerRadii: CGSize(width: radius, height: radius))
            let maskLayer = CAShapeLayer()
            maskLayer.frame = self.bounds
            maskLayer.path = path.cgPath
            self.layer.mask = maskLayer
        }
    }
}

/*
 calling like be :
 class View: UIView {
 override func layoutSubviews() {
 super.layoutSubviews()
 
 self.myView.roundCorners(corners: [.topLeft, .topRight, .bottomLeft, .bottomRight], radius: 8.0)
 }
 }
 */


