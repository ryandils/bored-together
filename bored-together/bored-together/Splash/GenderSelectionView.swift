//
//  GenderSelectionView.swift
//  bored-together
//
//  Created by Dennis Fedorishin on 6/15/19.
//  Copyright © 2019 team19. All rights reserved.
//

import Foundation
import UIKit

class GenderSelectionView: UIViewController,  UIPickerViewDelegate, UIPickerViewDataSource  {
    
    
    @IBOutlet weak var GenderSelectionPicker: UIPickerView!
    
    var genderPickerData: [String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.GenderSelectionPicker.delegate = self
        self.GenderSelectionPicker.dataSource = self
        
        // genderPickerData = ["Male", "Female", "Prefer not to answer"]
      
      genderPickerData = ["Agender", "Androgyne", "Androgynous", "Bigender",
                          "Cis", "Cisgender", "Cis Female", "Cis Male", "Cis Man",
                          "Cis Woman", "Cisgender Female", "Cisgender Male", "Cisgender Man",
                          "Cisgender Woman", "Female to Male", "FTM", "Gender Fluid", "Gender Nonconforming",
                          "Gender Questioning", "Gender Variant", "Genderqueer", "Intersex", "Male to Female",
                          "MTF", "Neither", "Neutrois", "Non-binary", "Other", "Pangender", "Trans", "Trans*",
                          "Trans Female", "Trans* Female", "Trans Male", "Trans* Male", "Trans Man", "Trans* Man",
                          "Trans Person", "Trans* Person", "Trans Woman", "Trans* Woman", "Transfeminine", "Transgender",
                          "Transgender Female", "Transgender Male", "Transgender Man", "Transgender Person", "Transgender Woman",
                          "Transmasculine", "Transsexual", "Transsexual Female", "Transsexual Male", "Transsexual Man", "Transsexual Person",
                          "Transsexual Woman",  "Two-Spirit", "I prefer not to specify"]
      
      let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
      swipeRight.direction = UISwipeGestureRecognizer.Direction.right
      self.view.addGestureRecognizer(swipeRight)
      
    }
  
    private func goBack() {
      let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
      let pageViewController = storyboard.instantiateViewController(withIdentifier: "PageViewController") as! PageViewController
      
      let transition = CATransition()
      transition.duration = 0.3
      transition.type = CATransitionType.push
      transition.subtype = CATransitionSubtype.fromLeft
      transition.timingFunction = CAMediaTimingFunction(name:CAMediaTimingFunctionName.easeInEaseOut)
      view.window!.layer.add(transition, forKey: kCATransition)
      present(pageViewController, animated: false, completion: nil)
    }
  
    @IBAction func back(_ sender: Any) {
      self.goBack()
    }
  
  
    @objc func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
          switch swipeGesture.direction {
          case UISwipeGestureRecognizer.Direction.right:
            // go back
            print("going back")
            self.goBack()
          default:
            break
          }
        }
      }
    
    @IBAction func GenderNextSlide(_ sender: Any) {
        print("passing gender slide")
        self.performSegue(withIdentifier: "GenderNextSlide" , sender: self)
    }
    // Number of columns of data
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return genderPickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        var label = UILabel()
        if let v = view {
            label = v as! UILabel
        }
        label.font = UIFont(name: "AirbnbCerealApp-Light", size: 22)
        label.text = genderPickerData[row]
        label.textAlignment = .center
        label.textColor = UIColor.white
    return label
    }
}

