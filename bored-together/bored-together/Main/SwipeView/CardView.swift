//
//  CardView.swift
//  bored-together
//
//  Created by Baily Troyer on 6/15/19.
//  Copyright © 2019 team19. All rights reserved.
//

import Foundation
import UIKit

let things: [thing] = [thing(img: #imageLiteral(resourceName: "KayakinginGLBA"), activity: "Kayaking", place: "Algonquin Provincial Park, ON", people: "15 people going"),
                       thing(img: #imageLiteral(resourceName: "skydive"), activity: "Sky diving ", place: "The Sky", people: "2 people going"),
                       thing(img: #imageLiteral(resourceName: "bubble"), activity: "Bubbly bath", place: "Your bathroom", people: "0 people going"),
                       thing(img: #imageLiteral(resourceName: "food"), activity: "Home cooked meal", place: "A kitchen", people: "1 person going")]

class CardView: UIView {
  

  @IBOutlet var contentView: UIView!
  @IBOutlet weak var newContentView: UIView!
  @IBOutlet weak var newContainerView: UIView!
  
  @IBOutlet weak var activity: UILabel!
  @IBOutlet weak var place: UILabel!
  @IBOutlet weak var pG: UILabel!
  @IBOutlet weak var actImage: UIImageView!
  
  public var thing: thing?
  
  var userModel : UserModel! {
    didSet{
      
      let thg = things[Int.random(in: 0 ..< 4)]

      self.actImage.image = thg.img
      self.activity.text = thg.activity
      self.place.text = thg.place
      self.pG.text = thg.people
      self.newContainerView.backgroundColor = .white
      
//      if Bool.random() {
//        self.newContainerView.backgroundColor = UIColor(rgb: 0x0080FE)
//      } else {
//        self.newContainerView.backgroundColor = .white
//      }
      
      // self.labelText.attributedText = self.attributeStringForModel(userModel: userModel)
      // self.imageViewBackground.image = UIImage(named:String(Int(1 + arc4random() % (8 - 1))))
    }
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    commonInit()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    commonInit()
  }
  
  func commonInit() {
    Bundle.main.loadNibNamed(CardView.className, owner: self, options: nil)
    newContentView.fixInView(self)
    
    // mageViewProfile.contentMode = .scaleAspectFill
    // imageViewProfile.layer.cornerRadius = 30
    // imageViewProfile.clipsToBounds = true
  }
  
  private func attributeStringForModel(userModel:thing) -> NSAttributedString{
    
    let attributedText = NSMutableAttributedString(string: "", attributes: [.foregroundColor: UIColor.white,.font:UIFont.boldSystemFont(ofSize: 25)])
    attributedText.append(NSAttributedString(string: "\nnums : - (nib view)" , attributes: [.foregroundColor: UIColor.white,.font:UIFont.systemFont(ofSize: 18)]))
    return attributedText
  }
  
}

extension UIView{
  
  func fixInView(_ container: UIView!) -> Void{
    
    self.translatesAutoresizingMaskIntoConstraints = false;
    self.frame = container.frame;
    container.addSubview(self);
    NSLayoutConstraint(item: self, attribute: .leading, relatedBy: .equal, toItem: container, attribute: .leading, multiplier: 1.0, constant: 0).isActive = true
    NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: container, attribute: .trailing, multiplier: 1.0, constant: 0).isActive = true
    NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: container, attribute: .top, multiplier: 1.0, constant: 0).isActive = true
    NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: container, attribute: .bottom, multiplier: 1.0, constant: 0).isActive = true
  }
}

extension NSObject {
  
  class var className: String {
    return String(describing: self)
  }
}

extension UIColor {
  static var random: UIColor {
    return UIColor(red: .random(in: 0...1),
                   green: .random(in: 0...1),
                   blue: .random(in: 0...1),
                   alpha: 1.0)
  }
}
