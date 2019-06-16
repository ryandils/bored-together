//
//  ActivityTableView.swift
//  bored-together
//
//  Created by Baily Troyer on 6/15/19.
//  Copyright © 2019 team19. All rights reserved.
//

import Foundation
import UIKit

internal struct activity {
    internal var title: String;
    internal var location: String;
    internal var minPeople: Int;
    internal var maxPeople: Int;
    internal var image: UIImage;
    internal var currentjoined: Int;
}

class ActivityTableView: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var ActivityTableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ActivityCell", for: indexPath) as! ActivityCell
        
        cell.TitleLabel.text = test_activitylist[indexPath.row].title
        cell.TitleLabel.font = UIFont(name: "AirbnbCerealApp-Light", size: 18)
        cell.LocationLabel.text = test_activitylist[indexPath.row].location
        cell.LocationLabel.font = UIFont(name: "AirbnbCerealApp-Light", size: 15)
        cell.AgeLabel.text = String(test_activitylist[indexPath.row].minPeople) + " to " + String(test_activitylist[indexPath.row].maxPeople)
        cell.AgeLabel.font = UIFont(name: "AirbnbCerealApp-Light", size: 22)
        cell.ImageView.image = test_activitylist[indexPath.row].image
        cell.JoinedLabel.text = String(test_activitylist[indexPath.row].currentjoined) + " joined so far"
        cell.JoinedLabel.font = UIFont(name: "AirbnbCerealApp-Light", size: 11)
        
        
        cell.ImageView.layer.cornerRadius = cell.ImageView.frame.size.width / 2
        cell.ImageView.clipsToBounds = true
       
//        cell.imageView?.frame = CGRect(x: 20, y: 20, width: 20, height: 20)
//        cell.imageView?.image = test_activitylist[indexPath.row].image
        
//        cell.contentView.backgroundColor = UIColor(white: 0.95, alpha: 1)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 135
    }
    
    
    
    var test_activitylist: [activity] = [activity(title: "River Kayaking", location: "Niagara River, NY 14051", minPeople: 2, maxPeople: 5, image: #imageLiteral(resourceName: "KayakinginGLBA"), currentjoined: 3),
                                         activity(title: "Mountain biking", location: "Holiday Valley, NY 14123", minPeople: 3, maxPeople: 10, image: #imageLiteral(resourceName: "Content_Team_080317_61569_Mountain_Biking_Beginners_lg"), currentjoined: 8)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
//        ActivityTableView.separatorColor = UIColor()
        ActivityTableView.dataSource = self
        ActivityTableView.delegate = self
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.ActivityTableView.reloadData()
    }
}
