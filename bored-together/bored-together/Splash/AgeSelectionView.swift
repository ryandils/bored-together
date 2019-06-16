//
//  AgeSelectionView.swift
//  bored-together
//
//  Created by Baily Troyer on 6/15/19.
//  Copyright © 2019 team19. All rights reserved.
//

import Foundation
import UIKit

class AgeSelectionView: UIViewController {
  
  @IBOutlet weak var age: UITextField!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
    swipeRight.direction = UISwipeGestureRecognizer.Direction.right
    self.view.addGestureRecognizer(swipeRight)
  }
  
  override func viewDidAppear(_ animated: Bool) {
    let continue_button = UIButton(frame: CGRect(x: 0, y: (self.view.frame.maxY - self.view.frame.maxY/12), width: 270, height: 50))
    
    // let continue_button = UIButton()
    
    // button text "sign in"
    continue_button.setTitle("Continue", for: .normal)
    
    continue_button.titleLabel?.font = .systemFont(ofSize: 23)
    
    // add button target
    continue_button.addTarget(self, action: #selector(next_view), for: .touchUpInside)
    
    // button color white
    continue_button.backgroundColor = UIColor.white
    
    continue_button.layer.cornerRadius = 10
    
    // center within view
    continue_button.center.x = self.view.frame.midX
    
    // 0080FE
    
    continue_button.setTitleColor(UIColor(rgb: 0x0080FE), for: .normal)
    
    // add button to view
    self.view.addSubview(continue_button)
    
    continue_button.bindToKeyboard()
    self.age.becomeFirstResponder()
  }
  
  @objc func next_view() {
    print("next")
    let storyBoard: UIStoryboard = UIStoryboard(name: "MainApp", bundle: nil)
    let mainSelectView = storyBoard.instantiateViewController(withIdentifier: "MainSelectView") as! MainSelectView
    self.present(mainSelectView, animated: true, completion: nil)
  }
  
  @objc func respondToSwipeGesture(gesture: UIGestureRecognizer) {
    if let swipeGesture = gesture as? UISwipeGestureRecognizer {
      switch swipeGesture.direction {
      case UISwipeGestureRecognizer.Direction.right:
        // go back
        
        self.goBack()
        
      default:
        break
      }
    }
  }
  
  private func goBack() {
    let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
    let genderSelectionView = storyboard.instantiateViewController(withIdentifier: "GenderSelectionView") as! GenderSelectionView
  
    let transition = CATransition()
    transition.duration = 0.3
    transition.type = CATransitionType.push
    transition.subtype = CATransitionSubtype.fromLeft
    transition.timingFunction = CAMediaTimingFunction(name:CAMediaTimingFunctionName.easeInEaseOut)
    view.window!.layer.add(transition, forKey: kCATransition)
    present(genderSelectionView, animated: false, completion: nil)
  }
  
  @IBAction func back(_ sender: Any) {
    goBack()
  }
  
}

extension UIView {
  func bindToKeyboard() {
    NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(_:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
  }
  
  @objc func keyboardWillChange(_ notification: NSNotification) {
    let duration = notification.userInfo![UIResponder.keyboardAnimationDurationUserInfoKey] as! Double
    let curve = notification.userInfo![UIResponder.keyboardAnimationCurveUserInfoKey] as! UInt
    let begginingFrame = (notification.userInfo![UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
    let endFrame = (notification.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
    let deltaY = endFrame.origin.y - begginingFrame.origin.y
    
    UIView.animateKeyframes(withDuration: duration, delay: 0.0, options: UIView.KeyframeAnimationOptions(rawValue: curve), animations: {
      self.frame.origin.y += deltaY
    }, completion: nil)
  }
}

extension UIColor {
  convenience init(red: Int, green: Int, blue: Int) {
    assert(red >= 0 && red <= 255, "Invalid red component")
    assert(green >= 0 && green <= 255, "Invalid green component")
    assert(blue >= 0 && blue <= 255, "Invalid blue component")
    
    self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
  }
  
  convenience init(rgb: Int) {
    self.init(
      red: (rgb >> 16) & 0xFF,
      green: (rgb >> 8) & 0xFF,
      blue: rgb & 0xFF
    )
  }
}
