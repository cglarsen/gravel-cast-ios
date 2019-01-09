//
//  Repository.swift
//  Explore
//
//  Created by Christian Graver on 16/12/2018.
//  Copyright © 2018 nordgrus. All rights reserved.
//

import Foundation
import Alamofire

// MARK: Cast Protocol
protocol CastService {
    func getCasts(completion: @escaping ([Cast]) -> Void)
    func getCast(with id: String, completion: @escaping (Cast) -> Void)
    func getTestCast(completion: @escaping (Cast) -> Void)
    func castCompleted()
}


// MARK: Strava Protocol
protocol StravaService {
    func getRoute(for id: String, completion: @escaping (DataResponse<String>) -> Void)
}
