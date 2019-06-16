//
//  SPageOne.swift
//  bored-together
//
//  Created by Baily Troyer on 6/15/19.
//  Copyright © 2019 team19. All rights reserved.
//

import Foundation
import Lottie
import UIKit

class SPageOne: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let title = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.frame.maxX - self.view.frame.maxX/3, height: 100))
    //label.center = CGPoint(x: 160, y: 285)
    title.center.y = view.center.y + self.view.frame.maxY/16
    title.center.x = view.center.x
    
    title.textAlignment = .center
    title.text = "Are you bored, and willing to go on an adventure?"
    
    title.textColor = .white

    guard let customFont = UIFont(name: "AirbnbCerealApp-Medium", size: 16) else {
      fatalError("""
        Failed to load the "AirbnbCereal-Medium" font.
        Make sure the font file is included in the project and the font name is spelled correctly.
        """
      )
    }
    
    title.font = customFont
    title.numberOfLines = 2
    self.view.addSubview(title)
    
    // ------ body ------
    
    let body = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.frame.maxX - self.view.frame.maxX/8, height: 100))
    //label.center = CGPoint(x: 160, y: 285)
    body.center.y = view.center.y + self.view.frame.maxY/6
    body.center.x = view.center.x
    
    body.textAlignment = .center
    body.text = "With BeTogether you can interact with people in your area by doing fun and crazy activites. Wanna go on a hike, or learn pottery? Let's get started!"
    
    body.textColor = .white
    
    let attributedString = NSMutableAttributedString(string: body.text!)
    
    
    // *** Create instance of `NSMutableParagraphStyle`
    let paragraphStyle = NSMutableParagraphStyle()
    
    // *** set LineSpacing property in points ***
    paragraphStyle.lineSpacing = 2 // Whatever line spacing you want in points
    
    // *** Apply attribute to string ***
    attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attributedString.length))
    
    // *** Set Attributed String to your label ***
    body.attributedText = attributedString
    
    guard let customBodyFont = UIFont(name: "AirbnbCerealApp-Light", size: 16) else {
      fatalError("""
        Failed to load the "AirbnbCereal-Medium" font.
        Make sure the font file is included in the project and the font name is spelled correctly.
        """
      )
    }
    
    body.font = customBodyFont
    body.numberOfLines = 3
    self.view.addSubview(body)
    
    
    //load earth lottie animation
    if let animationView:AnimationView = AnimationView(name: "loading") {
      animationView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
      
      // label.center.y = view.center.y
      animationView.center.x = self.view.center.x
      animationView.center.y = self.view.center.y - self.view.frame.maxY/5
      animationView.contentMode = .scaleAspectFill
      
      self.view.addSubview(animationView)
      animationView.play()
      
      animationView.loopMode = .loop
    }
  }
}
