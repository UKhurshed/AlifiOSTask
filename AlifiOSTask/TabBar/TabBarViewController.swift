//
//  TabBarViewController.swift
//  AlifiOSTask
//
//  Created by Khurshed Umarov on 19.04.2023.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let toDoVC = ToDoListViewController()
        let profileVC = ProfileViewController()
        
        toDoVC.navigationItem.backButtonTitle = ""
        profileVC.navigationItem.backButtonTitle = ""
        
        toDoVC.title = "To Do List"
        profileVC.title = "Profile"
        
        toDoVC.navigationItem.largeTitleDisplayMode = .always
        profileVC.navigationItem.largeTitleDisplayMode = .always
        
        let navToDo = UINavigationController(rootViewController: toDoVC)
        let navProfile = UINavigationController(rootViewController: profileVC)
        
        navToDo.tabBarItem = UITabBarItem(title: "To Do", image: UIImage(systemName: "list.bullet.clipboard"), tag: 1)
        navProfile.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person.crop.circle.fill"), tag: 1)
        
        navToDo.navigationBar.prefersLargeTitles = true
        navProfile.navigationBar.prefersLargeTitles = true
    
        setViewControllers([navToDo, navProfile], animated: false)
        
        
        tabBar.layer.insertSublayer(CAShapeLayer(), at: 0)
        
    }


}
