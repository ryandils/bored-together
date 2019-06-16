//
//  MainSelectView.swift
//  bored-together
//
//  Created by Baily Troyer on 6/15/19.
//  Copyright © 2019 team19. All rights reserved.
//

import Foundation
import TinderSwipeView
import UIKit

struct UserModel {
  
  let name : String!
  let num : String!
}

struct thing {
  var img: UIImage
  var activity: String
  var place: String
  var people: String
}

let names = ["Adam Gontier","Matt Walst","Brad Walst","Neil Sanderson","Barry Stock","Nicky Patson"]

class MainSelectView: UIViewController {
  
  @IBOutlet weak var containerView: UIView!
  
  private var swipeView: TinderSwipeView<UserModel>!{
    didSet{
      self.swipeView.delegate = self as TinderSwipeViewDelegate
    }
  }
  
  let userModels : [UserModel] =  {
    var model : [UserModel] = []
    for n in 1...30 {
      model.append(UserModel(name: names[Int(arc4random_uniform(UInt32(names.count)))], num: "\(n)"))
    }
    return model
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Dynamically create view for each tinder card
    var contentView: (Int, CGRect, UserModel) -> (UIView) = { (index: Int ,frame: CGRect , userModel: UserModel) -> (UIView) in
  
      // frame = CGRect(x: 0, y: 0, width: frame.width, height: 556)
      // frame.height = CGFloat(556)
//      print("---\(frame.height)")
      let customView = CardView(frame: CGRect(x: 0, y: 0, width: frame.width, height: 556))
      customView.newContentView.backgroundColor = .white
      print("---\(customView.frame.height)")
      customView.userModel = userModel
      // customView.buttonAction.addTarget(self, action: #selector(self.customViewButtonSelected), for: UIControl.Event.touchUpInside)
      return customView
      // Programitcally creating content view
//      if index % 2 != 0 {
//        return self.programticViewForOverlapreparey(frame: frame, userModel: userModel)
//      }
//        // loading contentview from nib
//      else{
//        let customView = CardView(frame: frame)
//        customView.userModel = userModel
//        // customView.buttonAction.addTarget(self, action: #selector(self.customViewButtonSelected), for: UIControl.Event.touchUpInside)
//        return customView
//      }
    }
    
    swipeView = TinderSwipeView<UserModel>(frame: containerView.bounds, contentView: contentView)
    containerView.addSubview(swipeView)
    swipeView.showTinderCards(with: userModels ,isDummyShow: true)
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    print("---\(segue.identifier)")
    
    if segue.identifier == "new_activity" {
      let viewController:ActivityTableView = segue.destination as! ActivityTableView
      viewController.showStartSomethingNew = true
    }
  }
  
  private func programticViewForOverlay(frame:CGRect, userModel:UserModel) -> UIView{
    
    let containerView = UIView(frame: frame)
    
//    let backGroundImageView = UIImageView(frame:containerView.bounds)
//    backGroundImageView.image = UIImage(named:String(Int(1 + arc4random() % (8 - 1))))
//    backGroundImageView.contentMode = .scaleAspectFill
//    backGroundImageView.clipsToBounds = true;
//    containerView.addSubview(backGroundImageView)
//
//    let profileImageView = UIImageView(frame:CGRect(x: 25, y: frame.size.height - 80, width: 60, height: 60))
//    profileImageView.image =  #imageLiteral(resourceName: "profileimage")
//    profileImageView.contentMode = .scaleAspectFill
//    profileImageView.layer.cornerRadius = 30
//    profileImageView.clipsToBounds = true
//    containerView.addSubview(profileImageView)
    
    let labelText = UILabel(frame:CGRect(x: 90, y: frame.size.height - 80, width: frame.size.width - 100, height: 60))
    labelText.attributedText = self.attributeStringForModel(userModel: userModel)
    labelText.numberOfLines = 2
    containerView.addSubview(labelText)
    
    return containerView
  }
  
//  @objc func customViewButtonSelected(button:UIButton){
//
//    if let customView = button.superview(of: CardView.self) , let userModel = customView.userModel{
//      print("button selected for \(userModel.name!)")
//    }
//
//  }
  
  private func attributeStringForModel(userModel:UserModel) -> NSAttributedString{
    
    let attributedText = NSMutableAttributedString(string: userModel.name, attributes: [.foregroundColor: UIColor.white,.font:UIFont.boldSystemFont(ofSize: 25)])
    attributedText.append(NSAttributedString(string: "\nnums :\( userModel.num!) (programitically)", attributes: [.foregroundColor: UIColor.white,.font:UIFont.systemFont(ofSize: 18)]))
    return attributedText
  }
  
  @IBAction func like(_ sender: Any) {
    if let swipeView = swipeView{
      swipeView.makeRightSwipeAction()
    }
  }
  
  @IBAction func disLike(_ sender: Any) {
    if let swipeView = swipeView{
      swipeView.makeLeftSwipeAction()
    }
  }
  
}

extension MainSelectView : TinderSwipeViewDelegate{
  
  func dummyAnimationDone() {
    //UIView.animate(withDuration: 1.0, delay: 0.0, options: .curveLinear, animations: {
      // self.viewNavigation.alpha = 1.0
    //}, completion: nil)
    //print("Watch out shake action")
  }
  
  func didSelectCard(model: Any) {
    print("Selected card")
  }
  
  func fallbackCard(model: Any) {
    // emojiView.rateValue =  2.5
    let userModel = model as! UserModel
    print("Cancelling \(userModel.name!)")
  }
  
  func cardGoesLeft(model: Any) {
    // emojiView.rateValue =  2.5
    let userModel = model as! UserModel
    print("Watchout Left \(userModel.name!)")
  }
  
  func cardGoesRight(model : Any) {
    // emojiView.rateValue =  2.5
    let userModel = model as! UserModel
    print("Watchout Right \(userModel.name!)")
  }
  
  func undoCardsDone(model: Any) {
    // emojiView.rateValue =  2.5
    let userModel = model as! UserModel
    print("Reverting done \(userModel.name!)")
  }
  
  func endOfCardsReached() {
    UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveLinear, animations: {
      // self.viewNavigation.alpha = 0.0
    }, completion: nil)
    print("End of all cards")
  }
  
  func currentCardStatus(card object: Any, distance: CGFloat) {
    if distance == 0 {
      // emojiView.rateValue =  2.5
    }else{
      let value = Float(min(abs(distance/100), 1.0) * 5)
      let sorted = distance > 0  ? 2.5 + (value * 5) / 10  : 2.5 - (value * 5) / 10
      // emojiView.rateValue =  sorted
    }
    print(distance)
  }
}

extension UIView {
  
  func superview<T>(of type: T.Type) -> T? {
    return superview as? T ?? superview.map { $0.superview(of: type)! }
  }
  
  func subview<T>(of type: T.Type) -> T? {
    return subviews.compactMap { $0 as? T ?? $0.subview(of: type) }.first
  }
}

class SegueFromLeft: UIStoryboardSegue {
  override func perform() {
    let src = self.source
    let dst = self.destination
    
    src.view.superview?.insertSubview(dst.view, aboveSubview: src.view)
    dst.view.transform = CGAffineTransform(translationX: -src.view.frame.size.width, y: 0)
    
    UIView.animate(withDuration: 0.25,
                   delay: 0.0,
                   options: .curveEaseInOut,
                   animations: {
                    dst.view.transform = CGAffineTransform(translationX: 0, y: 0)
    },
                   completion: { finished in
                    src.present(dst, animated: false, completion: nil)
    }
    )
  }
}

class SegueFromRight: UIStoryboardSegue
{
  override func perform()
  {
    let src = self.source
    let dst = self.destination
    
    src.view.superview?.insertSubview(dst.view, aboveSubview: src.view)
    dst.view.transform = CGAffineTransform(translationX: src.view.frame.size.width, y: 0)
    
    UIView.animate(withDuration: 0.25,
                   delay: 0.0,
                   options: UIView.AnimationOptions.curveEaseInOut,
                   animations: {
                    dst.view.transform = CGAffineTransform(translationX: 0, y: 0)
    },
                   completion: { finished in
                    src.present(dst, animated: false, completion: nil)
    }
    )
  }
}
