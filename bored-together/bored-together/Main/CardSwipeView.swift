//
//  CardSwipeView.swift
//  bored-together
//
//  Created by Baily Troyer on 6/15/19.
//  Copyright © 2019 team19. All rights reserved.
//

import Foundation
import TinderSwipeView
import UIKit

class CardSwipeView: UIViewController {
  
  let names = ["Adam Gontier","Matt Walst","Brad Walst","Neil Sanderson","Barry Stock","Nicky Patson"]
  
  @IBOutlet weak var containerView: UIView!
  
  //  private var swipeView: TinderSwipeView<UserModel>!{
  //    didSet{
  //      self.swipeView.delegate = self
  //    }
  //  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
}
