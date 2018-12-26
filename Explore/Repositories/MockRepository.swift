//
//  MockRepository.swift
//  Explore
//
//  Created by Christian Graver on 16/12/2018.
//  Copyright © 2018 nordgrus. All rights reserved.
//

import Foundation

struct MockRepository {
    
}

extension MockRepository: CastService {
    func getCasts(completion: @escaping ([Cast]) -> Void) {
        completion(makeCasts())
    }
    
    func getCast(with id: String, completion: @escaping (Cast) -> Void) {
        completion(makeCasts().first!)
    }
    
    func castCompleted() {
        
    }
    
    private func makeCasts() -> [Cast] {
        let location11 = (11.561335, 104.934333) //backyard
        let location12 = (11.561318, 104.933710)
        let location13 = (11.561318, 104.933296)
        
        
        let points1: [Discovery] = [Discovery(id: "pointA", name: "Point A", location: location11, clip: SoundClip(urlString: "pointA")),
                                   Discovery(id: "pointB", name: "Point B", location: location12, clip: SoundClip(urlString: "pointB")),
                                   Discovery(id: "pointC", name: "Point C", location: location13, clip: SoundClip(urlString: "pointC"))]
        
        let cast1 = Cast(id: "someCastId", name: "Åbn dine øjne", region: "Phnom Penh, Cambodia", discoveryPoints: points1)
        
        
        let location21 = (55.663965, 12.581971) //islandsbrygge
        let location22 = (55.663420, 12.582314)
        let location23 = (55.663566, 12.581477)
        
        
        let points2: [Discovery] = [Discovery(id: "pointA", name: "Point A", location: location21, clip: SoundClip(urlString: "pointA")),
                                   Discovery(id: "pointB", name: "Point B", location: location22, clip: SoundClip(urlString: "pointB")),
                                   Discovery(id: "pointC", name: "Point C", location: location23, clip: SoundClip(urlString: "pointC"))]
        
        let cast2 = Cast(id: "someCastId", name: "På en ø", region: "Islandsbrygge, Danmark", discoveryPoints: points2)
        
        let location31 = (55.763560, 12.407326) //hareskovby
        let location32 = (55.764152, 12.406607)
        let location33 = (55.764744, 12.406639)
        
        
        let points3: [Discovery] = [Discovery(id: "pointA", name: "Point A", location: location31, clip: SoundClip(urlString: "pointA")),
                                   Discovery(id: "pointB", name: "Point B", location: location32, clip: SoundClip(urlString: "pointB")),
                                   Discovery(id: "pointC", name: "Point C", location: location33, clip: SoundClip(urlString: "pointC"))]
        
        let cast3 = Cast(id: "someCastId", name: "Nær skov og mark", region: "Hareskovby, Danmark", discoveryPoints: points3)
        
        return [cast1, cast2, cast3]
    }
}
