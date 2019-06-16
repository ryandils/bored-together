//
//  DesignView.swift
//  bored-together
//
//  Created by Dennis Fedorishin on 6/15/19.
//  Copyright © 2019 team19. All rights reserved.
//

import Foundation
import UIKit
@IBDesignable class DesignView : UIView {
    
    @IBInspectable var cornerradius: CGFloat = 5
    @IBInspectable var shadowcolor: UIColor? = UIColor.black
    @IBInspectable var shadowOffsetWidth: Int = 8
    @IBInspectable var shadowOffsetHeight: Int = 8
    @IBInspectable var shadowopacity: Float = 0.2
    
    override func layoutSubviews() {
        layer.cornerRadius = cornerradius
        layer.shadowColor = shadowcolor?.cgColor
        layer.shadowOffset = CGSize(width: shadowOffsetWidth, height: shadowOffsetHeight)
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerradius)
        layer.shadowPath = shadowPath.cgPath
        layer.shadowOpacity = shadowopacity
    }
    
}
