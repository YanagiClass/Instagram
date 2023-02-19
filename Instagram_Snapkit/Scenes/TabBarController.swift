//
//  TabBarController.swift
//  Instagram_Snapkit
//
//  Created by 유용상 on 2023/02/19.
//

import UIKit

final class TabBarController : UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let feedViewContrller = UINavigationController(rootViewController: FeedViewController())
        feedViewContrller.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill"))
        let profileViewContrller = UINavigationController(rootViewController: ProfileViewController())
        
        profileViewContrller.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "person"), selectedImage: UIImage(systemName: "person.fill"))
        
        
        viewControllers = [feedViewContrller, profileViewContrller]
    }
    
    
    
}
