//
//  Repository.swift
//  Explore
//
//  Created by Christian Graver on 16/12/2018.
//  Copyright © 2018 nordgrus. All rights reserved.
//

import Foundation

// MARK: Cast Protocol
protocol CastService {
    func getCasts(completion: @escaping ([Cast]) -> Void)
    func getCast(with id: String, completion: @escaping (Cast) -> Void)
    func castCompleted()
}
