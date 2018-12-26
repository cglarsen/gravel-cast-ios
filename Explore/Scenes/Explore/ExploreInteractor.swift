//
//  ExploreInteractor.swift
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

protocol ExploreBusinessLogic {
    func viewCreated(request: Explore.Request.ViewCreated)
    func explorationStarted(request: Explore.Request.ExploreStart)
    func explorationPaused(request: Explore.Request.ExplorePause)
    func explorationFinished(request: Explore.Request.ExploreEnd)
    func debugDiscoveryHit(request: Explore.Request.DebugDiscoveryHit)
}

protocol ExploreDataStore {
    var cast: Cast! { get set }
}

class ExploreInteractor: ExploreDataStore {
    var presenter: ExplorePresentationLogic?
    var worker = ExploreWorker(service: MockRepository())

    var cast: Cast!
}

extension ExploreInteractor: ExploreBusinessLogic {
    func debugDiscoveryHit(request: Explore.Request.DebugDiscoveryHit) {
        worker.debugHitDiscovery()
    }
    
    func viewCreated(request: Explore.Request.ViewCreated) {
        worker.delegate = self
        
        if let cast = self.cast {
            presenter?.present(adventure: cast)
        } else {
            worker.fetchAdventure { (adventure) in
                self.cast = adventure
                self.presenter?.present(adventure: adventure)
            }
        }
    }
    
    func explorationStarted(request: Explore.Request.ExploreStart) {
        worker.startMonitor(discoveryPoints: cast.discoveryPoints)
    }
    
    func explorationPaused(request: Explore.Request.ExplorePause) {
        worker.pauseMonitorDiscoveryPoints()
    }
    
    func explorationFinished(request: Explore.Request.ExploreEnd) {
        worker.stopMonitorDiscoveryPoints()
    }
}

extension ExploreInteractor: Explorable {
    func nearestDiscoveryDistance(_ distance: Double) {
        presenter?.presentNearest(distance: distance)
    }
    
    func locationUpdated(location: CLLocation) {
        presenter?.presentUpdated(location: location)
    }
    
    func hitDiscovery(_ discovery: Discovery) {
        presenter?.presentFound(discovery: discovery)
    }
}