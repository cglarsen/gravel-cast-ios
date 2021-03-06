//
//  ExplorePresenter.swift
//  Explore
//
//  Created by Christian Graver on 16/12/2018.
//  Copyright (c) 2018 nordgrus. All rights reserved.
//
//  This file was generated by the Daman Clean Swift Xcode Templates
//  with inspiration from http://clean-swift.com
//

import UIKit
import CoreLocation

protocol ExplorePresentationLogic {
    func present(adventure: Cast)
    func presentUpdated(location: CLLocation)
    func presentNearest(distance: Double)
    func presentFound(discovery: Discovery)
    
}

class ExplorePresenter {
    weak var viewController: ExploreDisplayLogic?
}

extension ExplorePresenter: ExplorePresentationLogic {
    func presentUpdated(location: CLLocation) {
        let vm = Explore.DisplayData.MapPoint(lat: location.coordinate.latitude, long: location.coordinate.longitude)
        viewController?.display(mapPoint: vm)
    }
    
    func presentNearest(distance: Double) {
        let vm = Explore.DisplayData.Distance(distanceString: "\(Int(distance)) m")
        viewController?.displayNearest(distance: vm)
        print("nearest distance: \(distance)")
    }
    
    func presentFound(discovery: Discovery) {
        let vm = Explore.DisplayData.Disovery(name: discovery.name, point: discovery.location)
        viewController?.displayDiscovered(disovery: vm)
    }
    
    func present(adventure: Cast) {
        let pointVMs = adventure.discoveryPoints.map { (discovery) -> Explore.DisplayData.Disovery in
            return Explore.DisplayData.Disovery(name: discovery.name, point: discovery.location)
        }
        let vm = Explore.DisplayData.Adventure(name: adventure.name, points: pointVMs)
        viewController?.display(adventure: vm)
    }
}
