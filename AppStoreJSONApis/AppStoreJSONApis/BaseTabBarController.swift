//
//  BaseTabBarController.swift
//  AppStoreJSONApis
//
//  Created by Ivan Pestov on 31.03.2022.
//

import UIKit

class BaseTabBarController: UITabBarController {
    
    // 3 - maybe introduce or AppsSearchController
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        viewControllers = [
            createNavController(viewController: TodayController(), title: "Today", imageName: "today_icon"),
            createNavController(viewController: AppsPageController(), title: "Apps", imageName: "apps"),
            createNavController(viewController: AppsSearchController(), title: "Search", imageName: "search")
            
            
        ]
    }
    
    fileprivate func createNavController(viewController: UIViewController, title: String, imageName: String) -> UIViewController {
        
        let navController = UINavigationController(rootViewController: viewController)
        navController.navigationBar.prefersLargeTitles = true
        viewController.navigationItem.title = title
        viewController.view.backgroundColor = .white
        navController.tabBarItem.title = title
        navController.tabBarItem.image = UIImage(named: imageName)
        
        return navController
    }
}
