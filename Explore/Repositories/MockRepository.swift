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
    func getTestCast(completion: @escaping (Cast) -> Void) {
        let location1 = (55.692983, 12.535444) //veloropa
        let location2 = (55.745180, 12.438414) //gråpilevej
        let location3 = (55.827390, 12.228799) //mørdrupvej
        
        let points: [Discovery] = [Discovery(id: "pointA",
                                             name: "Veloropa Cykelcafé",
                                             imageUrlString: "veloropa",
                                             description: "Veloropa Cykelcafé er udgangspunktet for denne cast. Det er et rigtig hyggeligt sted at komme som cykelrytter. Der er altid varm kaffe på kanden og Kim Plesner, der driver stedet, er altid rar at snakke med, medmindre han er optaget af at være på Tinder",
                                             location: location1,
                                             clip: SoundClip(urlString: "pointA")),
                                    Discovery(id: "pointB",
                                              name: "Gråpilevej",
                                              imageUrlString: "graapilevej",
                                              description: "Dette er det første grus-segment, hvis du kører fra Veloropa og med uret rundt. Beliggende midt i Smørmosen, bliver man hver gang det gennemføres lige overrasket over, hvor meget skøn natur man kan finde helt på København.",
                                              location: location2,
                                              clip: SoundClip(urlString: "pointB")),
                                    Discovery(id: "pointC",
                                              name: "Mørdrupvej",
                                              imageUrlString: "moeldrupvej",
                                              description: "Med sit karakteristiske røde grus, er Møldrupvej en letkendelig klassiker. Pas på de store måne-agtige kratere, der især findes i vejens vestlige del. Hvis du kommer elegant igennem dette segment, er du en dygtig rytter. Af en eller anden grund er der altid dårligt vejr på Møldrupvej!",
                                              location: location3,
                                              clip: SoundClip(urlString: "pointC"))]
        
        // Load local route
        let routeUrl = Bundle.main.url(forResource: "nordgrus2018", withExtension: "xml")
        let parser = MyParser(url: routeUrl!)
        let nordgrusRoute = parser.parseXML()
        
        let nordgrusCast = Cast(id: "40896",
                                name: "Nordgrus",
                                description: "Den klassike cast, der tager udgangspunkt i ruten fra Nordgrus marts 2018. Du skal igennem 108km, hvis du vil hele vejen rundt. Kommer du det lover vi, at du ikke bliver skuffet.",
                                imageUrlString: "nordgrus",
                                region: "Nordsjælland",
                                discoveryPoints: points,
                                stravaRoute: nordgrusRoute)
        completion(nordgrusCast)
    }
    
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
        
        
        let points1: [Discovery] = [Discovery(id: "pointA", name: "Point A", imageUrlString: nil, description: nil, location: location11, clip: SoundClip(urlString: "pointA")),
                                   Discovery(id: "pointB", name: "Point B", imageUrlString: nil, description: nil, location: location12, clip: SoundClip(urlString: "pointB")),
                                   Discovery(id: "pointC", name: "Point C", imageUrlString: nil, description: nil, location: location13, clip: SoundClip(urlString: "pointC"))]
        
        let cast1 = Cast(id: "someCastId", name: "Åbn dine øjne", description: nil, imageUrlString: nil, region: "Phnom Penh, Cambodia", discoveryPoints: points1, stravaRoute: nil)
        
        
        let location21 = (55.663965, 12.581971) //islandsbrygge
        let location22 = (55.663420, 12.582314)
        let location23 = (55.663566, 12.581477)
        
        
        let points2: [Discovery] = [Discovery(id: "pointA", name: "Point A", imageUrlString: nil, description: nil, location: location21, clip: SoundClip(urlString: "pointA")),
                                   Discovery(id: "pointB", name: "Point B", imageUrlString: nil, description: nil, location: location22, clip: SoundClip(urlString: "pointB")),
                                   Discovery(id: "pointC", name: "Point C", imageUrlString: nil, description: nil, location: location23, clip: SoundClip(urlString: "pointC"))]
        
        let cast2 = Cast(id: "someCastId", name: "På en ø", description: nil, imageUrlString: nil, region: "Islandsbrygge, Danmark", discoveryPoints: points2, stravaRoute: nil)
        
        let location31 = (55.763560, 12.407326) //hareskovby
        let location32 = (55.764152, 12.406607)
        let location33 = (55.764744, 12.406639)
        
        
        let points3: [Discovery] = [Discovery(id: "pointA", name: "Point A", imageUrlString: nil, description: nil, location: location31, clip: SoundClip(urlString: "pointA")),
                                   Discovery(id: "pointB", name: "Point B", imageUrlString: nil, description: nil, location: location32, clip: SoundClip(urlString: "pointB")),
                                   Discovery(id: "pointC", name: "Point C", imageUrlString: nil, description: nil, location: location33, clip: SoundClip(urlString: "pointC"))]
        
        let cast3 = Cast(id: "someCastId", name: "Nær skov og mark", description: nil, imageUrlString: nil, region: "Hareskovby, Danmark", discoveryPoints: points3, stravaRoute: nil)
        
        return [cast1, cast2, cast3]
    }
}
