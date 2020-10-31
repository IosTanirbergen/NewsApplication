//
//  MenuBar.swift
//  NewsApplication
//
//  Created by Devnull on 10/31/20.
//  Copyright © 2020 Tanirbergen Kaldibai. All rights reserved.
//

import UIKit


class MenuBar: UITabBarController, UITabBarControllerDelegate{
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        return true
    }
    
    override func viewDidLoad() {
        setupViewControllers()
        navigationController?.navigationBar.topItem?.backBarButtonItem?.tintColor = .white
        tabBar.tintColor = #colorLiteral(red: 0.2806117535, green: 0.604807198, blue: 0.4692806602, alpha: 1)
        tabBar.backgroundColor = .white
        tabBar.isTranslucent = false
        tabBar.barTintColor = .white
        delegate = self
        navigationController?.navigationBar.isTranslucent = false
        SettingNavBar()
    }
    
     fileprivate func SettingNavBar() {
            let navBar = navigationController?.navigationBar
            navBar?.isHidden = false
            navBar?.topItem?.title = "News"
            navBar?.isTranslucent = false
    }
        
    func setupViewControllers() {
        let first = templateNavController(rootViewController: TopHeadlinesViewController(), title: "Top headliens")
        let second = templateNavController(rootViewController: EverythingViewController(), title: "Everything")
        viewControllers = [first, second]
        
    }

    func templateNavController(rootViewController: UIViewController, title: String) -> UINavigationController{
         let navController = UINavigationController(rootViewController: rootViewController)
         navController.tabBarItem.title = title
         navController.tabBarItem.setTitleTextAttributes([kCTFontAttributeName as NSAttributedString.Key: UIFont.systemFont(ofSize: 16.0)], for: .normal)
         navController.navigationBar.isTranslucent = false
         navController.navigationBar.barTintColor = #colorLiteral(red: 0.2806117535, green: 0.604807198, blue: 0.4692806602, alpha: 1)
         navController.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -15)
         return navController
   }

}
