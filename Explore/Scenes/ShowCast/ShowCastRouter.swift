//
//  ShowCastRouter.swift
//  Explore
//
//  Created by Christian Graver on 03/01/2019.
//  Copyright (c) 2019 nordgrus. All rights reserved.
//
//  This file was generated by the Daman Clean Swift Xcode Templates
//  with inspiration from http://clean-swift.com
//

import UIKit

@objc protocol ShowCastRoutingLogic {
}

protocol ShowCastDataPassing {
    var dataStore: ShowCastDataStore? { get }
}

class ShowCastRouter: NSObject, ShowCastDataPassing {
    weak var viewController: ShowCastViewController?
    var dataStore: ShowCastDataStore?
}

extension ShowCastRouter: ShowCastRoutingLogic {
    
}
