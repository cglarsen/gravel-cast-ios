//
//  ListCastsRouter.swift
//  Explore
//
//  Created by Christian Graver on 20/12/2018.
//  Copyright (c) 2018 nordgrus. All rights reserved.
//
//  This file was generated by the Daman Clean Swift Xcode Templates
//  with inspiration from http://clean-swift.com
//

import UIKit

@objc protocol ListCastsRoutingLogic {
    func navigateToCast(for index: Int)
}

protocol ListCastsDataPassing {
    var dataStore: ListCastsDataStore? { get }
}

class ListCastsRouter: NSObject, ListCastsDataPassing {
    weak var viewController: ListCastsViewController?
    var dataStore: ListCastsDataStore?
}

extension ListCastsRouter: ListCastsRoutingLogic {
    func navigateToCast(for index: Int) {
        guard let cast = dataStore?.casts[safe: index] else { return }
        
        let exploreVC = ExploreViewController.instantiate()
       
        // Pass data
        if var destinationDS = exploreVC.router?.dataStore {
            passDataToExploreVC(cast: cast, destination: &destinationDS)
        }
        
        // Push
        viewController?.present(exploreVC, animated: true)
    }
    
    // MARK: Passing data
    private func passDataToExploreVC(cast: Cast, destination: inout ExploreDataStore) {
        destination.cast = cast
    }
    
}