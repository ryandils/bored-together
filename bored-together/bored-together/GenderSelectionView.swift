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
        
        genderPickerData = ["Male", "Female", "Prefer not to answer"]
    }
    
    // Number of columns of data
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return genderPickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> UIView {
        
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

