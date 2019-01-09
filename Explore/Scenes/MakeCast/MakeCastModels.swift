//
//  MakeCastModels.swift
//  Explore
//
//  Created by Christian Graver on 25/12/2018.
//  Copyright (c) 2018 nordgrus. All rights reserved.
//
//  This file was generated by the Daman Clean Swift Xcode Templates
//  with inspiration from http://clean-swift.com
//

import UIKit

enum MakeCast {
    enum Request { }
    enum Response { }
    enum DisplayData { }
}

extension MakeCast.Request {
    
}

extension MakeCast.Response {
    
}

extension MakeCast.DisplayData {
    struct Cast {
        var name: String
        var image: String
        var description: String
        var points: [Explore.DisplayData.Disovery]
    }
    
    struct MapPoint {
        var lat: Double
        var long: Double
    }
    
    struct Disovery {
        var name: String
        var point:(Double, Double)
        var image: String?
        var text: String?
        var clip: SoundClip?
    }
}
