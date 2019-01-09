//
//  MainTabbar.swift
//  Telekraeftvaerket
//
//  Created by Christian Graver Larsen on 24/11/2017.
//  Copyright (c) 2018 nordgrus. All rights reserved.
//

import UIKit

class MainTabBar: UITabBarController {
    // MARK: - Properties
    // Navigation Controllers
    let listCastsNavC = UINavigationController()
    let makeCastNavC = UINavigationController()
    let showCastNavC = UINavigationController()
    
    // Base ViewControllers
    let listCastsVC = ListCastsViewController.instantiate()
    let makeCastVC = MakeCastViewController.instantiate()
    let showCastVC = ShowCastViewController.instantiate()
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        listCastsNavC.setNavigationBarHidden(true, animated: false)
        makeCastNavC.setNavigationBarHidden(true, animated: false)
        showCastNavC.setNavigationBarHidden(true, animated: false)
        
        listCastsNavC.setViewControllers([listCastsVC], animated: false)
        makeCastNavC.setViewControllers([makeCastVC], animated: false)
        showCastNavC.setViewControllers([showCastVC], animated: false)
        
        viewControllers = [listCastsNavC, makeCastNavC, showCastNavC]

        tabBar.barTintColor = UIColor.primaryColor
        tabBar.isTranslucent = false
        
        self.selectedIndex = 0
        let titles = ["Explore","Make", "Show"]
    
        for (index, title) in titles.enumerated() {
            self.tabBar.items![index].title = title
            //self.tabBar.items![index].image = images[index].withRenderingMode(.alwaysOriginal)
            //self.tabBar.items![index].selectedImage = imagesSelected[index].withRenderingMode(.alwaysOriginal)
        }
                
        // Setup appearance
        let appearance = UITabBarItem.appearance()
        let normalAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12.0), NSAttributedString.Key.foregroundColor: UIColor.gray]
        let selectedAttributes = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 12.0), NSAttributedString.Key.foregroundColor: UIColor.secondaryColor]
        appearance.setTitleTextAttributes(normalAttributes, for: .normal)
        appearance.setTitleTextAttributes(selectedAttributes, for: .selected)
        UITabBar.appearance().clipsToBounds = true
        UITabBar.appearance().layer.borderWidth = 0.0
    }
}
