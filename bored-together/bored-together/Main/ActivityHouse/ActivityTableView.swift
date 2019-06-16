//
//  ActivityTableView.swift
//  bored-together
//
//  Created by Baily Troyer on 6/15/19.
//  Copyright © 2019 team19. All rights reserved.
//

import Foundation
import UIKit
import Apollo
import Alamofire

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
  @IBOutlet weak var bottomSpace: NSLayoutConstraint!
  
    public var showStartSomethingNew = false
    public var boredapidata: [String] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ActivityCell", for: indexPath) as! ActivityCell
        
        let parameters: [String: Any] = [
            "query" : "{ generatedActivities { name } }"
        ]
        
        Alamofire.request("http://35.184.77.163:4000/graphql", method: .post, parameters: parameters, encoding: JSONEncoding.default)
            .responseJSON { response in
                print(response)
                print("look up")
                let jsonData = response.data
                var dictionary = try? JSONSerialization.jsonObject(with: jsonData!, options: .mutableLeaves) as! NSDictionary
                dictionary = dictionary!["data"] as! NSDictionary
                // dictionary = dictionary!["generatedActivities"] as! NSArray
                
                for dict in dictionary?.value(forKey: "generatedActivities") as! NSArray {
                    print("---->\((dict as! NSDictionary)["name"]!)")
                    self.boredapidata.append((dict as! NSDictionary)["name"]! as! String)
                    // (dict as NSDictionary)
                }
                
                cell.TitleLabel.text = self.boredapidata[indexPath.row]
                cell.TitleLabel.font = UIFont(name: "AirbnbCerealApp-Light", size: 18)
                cell.LocationLabel.text = self.test_activitylist[indexPath.row].location
                cell.LocationLabel.font = UIFont(name: "AirbnbCerealApp-Light", size: 15)
                cell.AgeLabel.text = String(self.test_activitylist[indexPath.row].minPeople) + " to " + String(self.test_activitylist[indexPath.row].maxPeople)
                cell.AgeLabel.font = UIFont(name: "AirbnbCerealApp-Light", size: 22)
                cell.ImageView.image = self.test_activitylist[indexPath.row].image
                cell.JoinedLabel.text = String(self.test_activitylist[indexPath.row].currentjoined) + " joined so far"
                cell.JoinedLabel.font = UIFont(name: "AirbnbCerealApp-Light", size: 11)
                
                
                cell.ImageView.layer.cornerRadius = cell.ImageView.frame.size.width / 2
                cell.ImageView.clipsToBounds = true
                
                // dictionary?.value(forKey: "generatedActivities") as! NSArray).forEach({ ($0 as NSDictionary)["name"] }
                
                print(dictionary)
                print("look again")
                
        }
        
        
       
//        cell.imageView?.frame = CGRect(x: 20, y: 20, width: 20, height: 20)
//        cell.imageView?.image = test_activitylist[indexPath.row].image
        
//        cell.contentView.backgroundColor = UIColor(white: 0.95, alpha: 1)
        let query = LastnamequeryQuery()
        apollo.fetch(query: query) { results, error in
            print(results?.data.unsafelyUnwrapped)
            print(error)
        }
        
        
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 135
    }
  
    var test_activitylist: [activity] = [activity(title: "River Kayaking", location: "Niagara River, NY 14051", minPeople: 2, maxPeople: 5, image: #imageLiteral(resourceName: "KayakinginGLBA"), currentjoined: 3),
                                         activity(title: "Mountain biking", location: "Holiday Valley, NY 14123", minPeople: 3, maxPeople: 10, image: #imageLiteral(resourceName: "KayakinginGLBA"), currentjoined: 8),
                                        activity(title: "Mountain biking", location: "Fort Erie, NY 12313", minPeople: 5, maxPeople: 10, image: #imageLiteral(resourceName: "Content_Team_080317_61569_Mountain_Biking_Beginners_lg"), currentjoined: 8),
                                        activity(title: "Mountain biking", location: "Hudson Valley, NY 14423", minPeople: 12, maxPeople: 20, image: #imageLiteral(resourceName: "Content_Team_080317_61569_Mountain_Biking_Beginners_lg"), currentjoined: 9),]
    override func viewWillAppear(_ animated: Bool) {
        let parameters: [String: Any] = [
            "query" : "{ generatedActivities { name } }"
        ]
        
        Alamofire.request("http://35.184.77.163:4000/graphql", method: .post, parameters: parameters, encoding: JSONEncoding.default)
            .responseJSON { response in
                print(response)
                print("look up")
                let jsonData = response.data
                var dictionary = try? JSONSerialization.jsonObject(with: jsonData!, options: .mutableLeaves) as! NSDictionary
                dictionary = dictionary!["data"] as! NSDictionary
                // dictionary = dictionary!["generatedActivities"] as! NSArray
                
                for dict in dictionary?.value(forKey: "generatedActivities") as! NSArray {
                    print("---->\((dict as! NSDictionary)["name"]!)")
                    self.boredapidata.append((dict as! NSDictionary)["name"]! as! String)
                    // (dict as NSDictionary)
                }
                
                // dictionary?.value(forKey: "generatedActivities") as! NSArray).forEach({ ($0 as NSDictionary)["name"] }
                
                print(dictionary)
                print("look again")
                
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
      if showStartSomethingNew {
        print("SHOW SOMETHING NEW")
      } else {
        // self.tableViewDistance.constant = 0
        print("DON'T SHOW SOMETHING NEW")
        bottomSpace.constant = 0
      }
        
//        Alamofire.request("http://35.184.77.163:4000/graphql", method: .post, parameters: "{ query: '{ posts { title } }' }", headers: "{ 'Content-Type': 'application/json' }")
        
        
//        let test = GeneratedActivitiesQuery()
//        apollo.fetch(query: test) { results, error in
//            print(results?.data.unsafelyUnwrapped)
//            print(error)
//            print("look up")
//        }
        
//        ActivityTableView.separatorColor = UIColor()
        
        
        
        
        
        ActivityTableView.dataSource = self
        ActivityTableView.delegate = self
      
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        self.view.addGestureRecognizer(swipeRight)
        
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
  
    private func goBack() {
        self.performSegue(withIdentifier: "back_to_main", sender: self)
//      let storyboard: UIStoryboard = UIStoryboard(name: "MainApp", bundle: nil)
//      let mainSelectView = storyboard.instantiateViewController(withIdentifier: "MainSelectView") as! MainSelectView
//
//      let transition = CATransition()
//      transition.duration = 0.3
//      transition.type = CATransitionType.push
//      transition.subtype = CATransitionSubtype.fromLeft
//      transition.timingFunction = CAMediaTimingFunction(name:CAMediaTimingFunctionName.easeInEaseOut)
//      view.window!.layer.add(transition, forKey: kCATransition)
//      present(mainSelectView, animated: false, completion: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.ActivityTableView.reloadData()
    }
}
