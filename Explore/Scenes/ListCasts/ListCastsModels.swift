//
//  ListCastsModels.swift
//  Explore
//
//  Created by Christian Graver on 20/12/2018.
//  Copyright (c) 2018 nordgrus. All rights reserved.
//
//  This file was generated by the Daman Clean Swift Xcode Templates
//  with inspiration from http://clean-swift.com
//

import UIKit

enum ListCasts {
    enum Request { }
    enum Response { }
    enum DisplayData { }
}

extension ListCasts.Request {
    struct ViewCreated { }
    struct CastSelected {
        var index: Int
    }
    
}

extension ListCasts.Response {
    
}

extension ListCasts.DisplayData {
    struct Cast {
        var name: String
        var region: String
        var numberOfDiscoveryPoints: Int
    }
}
