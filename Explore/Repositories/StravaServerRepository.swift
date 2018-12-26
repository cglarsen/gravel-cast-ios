//
//  StravaAPIRepository.swift
//  Explore
//
//  Created by Christian Graver on 26/12/2018.
//  Copyright © 2018 nordgrus. All rights reserved.
//

import Foundation
import Alamofire

class StravaServerRepository {
    let baseURL: String = Constants.StravaAPI.baseURL
  
    let manager: SessionManager
    
    init() {
        let configuration = SessionManager.default.session.configuration
        //configuration.httpAdditionalHeaders = ["Accept": "application/json"]
        //configuration.httpAdditionalHeaders = ["Content-Type": "application/json"]
        configuration.httpAdditionalHeaders = ["Authorization": Constants.StravaAPI.apiToken]
        configuration.timeoutIntervalForRequest = 20.0
        manager = SessionManager(configuration: configuration)
    }
}

extension StravaServerRepository: StravaService {
    func getRoute(for id: String, completion: @escaping (DataResponse<String>) -> Void) {
        manager.request(self.baseURL + "v3/routes/\(id)/export_gpx", method: .get, parameters: nil).responseString(completionHandler: completion)
    }
}
