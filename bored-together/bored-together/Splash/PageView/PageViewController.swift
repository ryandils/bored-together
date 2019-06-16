//
//  PageViewController.swift
//  bored-together
//
//  Created by Baily Troyer on 6/15/19.
//  Copyright © 2019 team19. All rights reserved.
//

import Foundation
import FBSDKCoreKit
import FBSDKLoginKit
import UIKit

class PageViewController: UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {
  
  var pageControl = UIPageControl()
  var sign_in_button = UIButton()
  
  var facebook_button = UIButton()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    print("test")
    
    self.dataSource = self
    self.delegate = self
    
    if let firstViewController = orderedViewControllers.first {
      setViewControllers([firstViewController],
                         direction: .forward,
                         animated: true,
                         completion: nil)
    }
    
    configurePageControl()
    
    //    if(AccessToken.current == nil){
    //      print("Not logged in ")
    //    }else{
    //      print("Logged in already")
    //      getFacebookUserInfo()
    //    }
  }
  
  override func viewDidAppear(_ animated: Bool) {
    
    // 255, 35
    
    facebook_button = UIButton(frame: CGRect(x: 0, y: (self.view.frame.maxY - self.view.frame.maxY/7), width: 265, height: 45))
    
    facebook_button.setImage(#imageLiteral(resourceName: "facebook_button_image"), for: .normal)
    
    // add button target
    facebook_button.addTarget(self, action: #selector(getFacebookUserInfo), for: .touchUpInside)
    
    // rounded
    facebook_button.layer.cornerRadius = 10
    
    // center within view
    facebook_button.center.x = self.view.frame.midX
    
    //set alpha for fade-in animation
    facebook_button.alpha = 0.0
    
    // add button to view
    self.view.addSubview(facebook_button)
    
    //do fade-in animation
    UIView.animate(withDuration: 0.4, animations: {
      self.facebook_button.alpha = 1.0
    })
  }
  
  @objc func getFacebookUserInfo(){
    let fbLoginManager : LoginManager = LoginManager()
    
    fbLoginManager.logIn(permissions: ["public_profile","email"], from: self, handler: { (result, error) in
      if (error == nil){
        let fbloginresult : LoginManagerLoginResult = result!
        if fbloginresult.grantedPermissions != nil {
          if(fbloginresult.grantedPermissions.contains("email")) {
            if((AccessToken.current) != nil){
              GraphRequest(graphPath: "me", parameters: ["fields": "id, name, first_name, last_name, picture.type(large), email, gender, age_range"]).start(completionHandler: { (connection, result, error) -> Void in
                if (error == nil){
                  let dict: NSDictionary = result as! NSDictionary
                  if let token = AccessToken.current?.tokenString {
                    print("tocken: \(token)")
                    
                    let userDefult = UserDefaults.standard
                    userDefult.setValue(token, forKey: "access_tocken")
                    userDefult.synchronize()
                  }
                  if let user : NSString = dict.object(forKey:"name") as! NSString? {
                    print("user: \(user)")
                  }
                  if let id : NSString = dict.object(forKey:"id") as? NSString {
                    print("id: \(id)")
                  }
                  if let email : NSString = (result! as AnyObject).value(forKey: "email") as? NSString {
                    print("email: \(email)")
                  }
                  print("PERFORMING SEGUE")
                 // self.performSegue(withIdentifier: "to_main_app", sender: self)
                    let storyBoard: UIStoryboard = UIStoryboard(name: "Profile", bundle: nil)
                    let mainSelectView = storyBoard.instantiateViewController(withIdentifier: "ProfileView") as! ProfileView
                    self.present(mainSelectView, animated: true, completion: nil)
                }
              })
            }
          }
        }
      }
    })
    
  }
  
  func configurePageControl() {
    // The total number of pages that are available is based on how many available colors we have.
    pageControl = UIPageControl(frame: CGRect(x: 0, y: (self.view.frame.maxY - self.view.frame.maxY/13), width: UIScreen.main.bounds.width, height: 40))
    self.pageControl.numberOfPages = orderedViewControllers.count
    self.pageControl.currentPage = 0
    self.pageControl.tintColor = UIColor.black
    self.pageControl.pageIndicatorTintColor = UIColor.white
    self.pageControl.currentPageIndicatorTintColor = UIColor.black
    self.view.addSubview(pageControl)
  }
  
  // MARK: Delegate functions
  func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
    let pageContentViewController = pageViewController.viewControllers![0]
    self.pageControl.currentPage = orderedViewControllers.index(of: pageContentViewController)!
  }
  
  func newVc(viewController: String) -> UIViewController {
    return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: viewController)
  }
  
  lazy var orderedViewControllers: [UIViewController] = {
    return [self.newVc(viewController: "sOne"),
            self.newVc(viewController: "sTwo"),
            self.newVc(viewController: "sThree")]
  }()
  
  
  func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
    guard let viewControllerIndex = orderedViewControllers.index(of: viewController) else {
      return nil
    }
    
    let previousIndex = viewControllerIndex - 1
    
    // User is on the first view controller and swiped left to loop to
    // the last view controller.
    guard previousIndex >= 0 else {
      return orderedViewControllers.last
      // Uncommment the line below, remove the line above if you don't want the page control to loop.
      // return nil
    }
    
    guard orderedViewControllers.count > previousIndex else {
      return nil
    }
    
    return orderedViewControllers[previousIndex]
  }
  
  func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
    guard let viewControllerIndex = orderedViewControllers.index(of: viewController) else {
      return nil
    }
    
    let nextIndex = viewControllerIndex + 1
    let orderedViewControllersCount = orderedViewControllers.count
    
    // User is on the last view controller and swiped right to loop to
    // the first view controller.
    guard orderedViewControllersCount != nextIndex else {
      return orderedViewControllers.first
      // Uncommment the line below, remove the line above if you don't want the page control to loop.
      // return nil
    }
    
    guard orderedViewControllersCount > nextIndex else {
      return nil
    }
    
    return orderedViewControllers[nextIndex]
  }
  
}
