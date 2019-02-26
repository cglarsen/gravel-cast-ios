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
        completion(makeNordgrus2018())
        //completion(makeGravelCast1())
//        completion(makeGyrTestCast())
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
        
        
        
        return [cast1, cast2, cast3, makeGravelCast1(), makeGyrTestCast()]
    }
    
    private func makeGravelCast1() -> Cast {
        // Gravel Cast 1
        
        let points: [Discovery] = [Discovery(id: "point1",
                                             name: "Hareskovene",
                                             imageUrlString: nil,
                                             description: nil,
                                             location: (55.767978, 12.409017),
                                             clip: SoundClip(urlString: "gc1_dp1")),
                                   Discovery(id: "point2",
                                             name: "Flyvestation Værløse",
                                             imageUrlString: nil,
                                             description: nil,
                                             location: (55.768858, 12.347481),
                                             clip: SoundClip(urlString: "gc1_dp2")),
                                   Discovery(id: "point3",
                                             name: "Kattehale",
                                             imageUrlString: nil,
                                             description: nil,
                                             location: (55.851780, 12.361800),
                                             clip: SoundClip(urlString: "gc1_dp3")),
                                   Discovery(id: "point4",
                                             name: "Vaserne",
                                             imageUrlString: nil,
                                             description: nil,
                                             location: (55.816851, 12.435884),
                                             clip: SoundClip(urlString: "gc1_dp4")),
                                   Discovery(id: "point5",
                                             name: "Holtekollen",
                                             imageUrlString: nil,
                                             description: nil,
                                             location: (55.807369, 12.485271),
                                             clip: SoundClip(urlString: "gc1_dp5")),
                                   Discovery(id: "point6",
                                             name: "Raadvad",
                                             imageUrlString: nil,
                                             description: nil,
                                             location: (55.807541, 12.559144),
                                             clip: SoundClip(urlString: "gc1_dp6")),
                                   Discovery(id: "point7",
                                             name: "Eremitagesletten",
                                             imageUrlString: nil,
                                             description: nil,
                                             location: (55.796948, 12.571272),
                                             clip: SoundClip(urlString: "gc1_dp7")),
//                    Gråpilevej    55.745121, 12.438429
//                    Store Hareskov    55.765756, 12.407467
//                    Lille Hareskov    55.772531, 12.386119
//                    Skallemosen Sø    55.762957, 12.366339
//                    Præ Flyvestation Værløse    55.763650, 12.351253
//                    Præstesø    55.778365, 12.328783
            Discovery(id: "sector1",
                      name: "Gråpilevej",
                      imageUrlString: nil,
                      description: nil,
                      location: (55.745121, 12.438429),
                      clip: SoundClip(urlString: "gc1_s1")),
            Discovery(id: "sector2",
                      name: "Store Hareskov",
                      imageUrlString: nil,
                      description: nil,
                      location: (55.765756, 12.407467),
                      clip: SoundClip(urlString: "gc1_s2")),
            Discovery(id: "sector3",
                      name: "Lille Hareskov",
                      imageUrlString: nil,
                      description: nil,
                      location: (55.772531, 12.386119),
                      clip: SoundClip(urlString: "gc1_s3")),
            Discovery(id: "sector4",
                      name: "Skallemosen Sø",
                      imageUrlString: nil,
                      description: nil,
                      location: (55.762957, 12.366339),
                      clip: SoundClip(urlString: "gc1_s4")),
            Discovery(id: "sector5",
                      name: "Præ Flyvestation Værløse",
                      imageUrlString: nil,
                      description: nil,
                      location: (55.763650, 12.351253),
                      clip: SoundClip(urlString: "gc1_s5")),
            Discovery(id: "sector6",
                      name: "Præstesø",
                      imageUrlString: nil,
                      description: nil,
                      location: (55.778365, 12.328783),
                      clip: SoundClip(urlString: "gc1_s6")),
            //        Almagerbakke    55.789250, 12.307215
            //        Kobakkevej    55.815858, 12.295342
            //        Farum Lillevang    55.824451, 12.314925
            //        Midtervej    55.838936, 12.357501
            //        Ti søers bagvej    55.840356, 12.381621
            //        Furesøstien/Vaserne    55.816802, 12.432160
            Discovery(id: "sector7",
                      name: "Almagerbakke",
                      imageUrlString: nil,
                      description: nil,
                      location: (55.789250, 12.307215),
                      clip: SoundClip(urlString: "gc1_s7")),
            Discovery(id: "sector8",
                      name: "Kobakkevej",
                      imageUrlString: nil,
                      description: nil,
                      location: (55.815858, 12.295342),
                      clip: SoundClip(urlString: "gc1_s8")),
            Discovery(id: "sector9",
                      name: "Farum Lillevang",
                      imageUrlString: nil,
                      description: nil,
                      location: (55.824451, 12.314925),
                      clip: SoundClip(urlString: "gc1_s9")),
            Discovery(id: "sector10",
                      name: "Midtervej",
                      imageUrlString: nil,
                      description: nil,
                      location: (55.838936, 12.357501),
                      clip: SoundClip(urlString: "gc1_s10")),
            Discovery(id: "sector11",
                      name: "Ti søers bagvej",
                      imageUrlString: nil,
                      description: nil,
                      location: (55.840356, 12.381621),
                      clip: SoundClip(urlString: "gc1_s11")),
            Discovery(id: "sector12",
                      name: "Vaserne",
                      imageUrlString: nil,
                      description: nil,
                      location: (55.816802, 12.432160),
                      clip: SoundClip(urlString: "gc1_s12")),
            //        Stenvej    55.810402, 12.480797
            //        Det Danske Schweiz    55.800587, 12.505131
            //        Stampemarken    55.807978, 12.530047
            //        Dyrehaven    55.803275, 12.563008
            Discovery(id: "sector13",
                      name: "Stenvej",
                      imageUrlString: nil,
                      description: nil,
                      location: (55.810402, 12.480797),
                      clip: SoundClip(urlString: "gc1_s13")),
            Discovery(id: "sector14",
                      name: "Det Danske Schweiz",
                      imageUrlString: nil,
                      description: nil,
                      location: (55.801611, 12.501003),
                      clip: SoundClip(urlString: "gc1_s14")),
            Discovery(id: "sector15",
                      name: "Stampemarken",
                      imageUrlString: nil,
                      description: nil,
                      location: (55.807978, 12.530047),
                      clip: SoundClip(urlString: "gc1_s15")),
            Discovery(id: "sector16",
                      name: "Dyrehaven",
                      imageUrlString: nil,
                      description: nil,
                      location: (55.803275, 12.563008),
                      clip: SoundClip(urlString: "gc1_s16")),
            Discovery(id: "end",
                      name: "Slut",
                      imageUrlString: nil,
                      description: nil,
                      location: (55.776256, 12.586696),
                      clip: SoundClip(urlString: "gc1_end"))]
        
        // Load local route
        let routeUrl = Bundle.main.url(forResource: "gravelcast1", withExtension: "xml")
        let parser = MyParser(url: routeUrl!)
        let gravelcast1Route = parser.parseXML()
        
        
        let cast = Cast(id: "someCastId", name: "GravelCast 1", description: nil, imageUrlString: nil, region: "Nordsjælland, Danmark", discoveryPoints: points, stravaRoute: gravelcast1Route)
        return cast
    }
    
    private func makeNordgrus2018()  -> Cast {
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
        
        return nordgrusCast
    }
    
    
    private func makeGyrTestCast() -> Cast {
        let points: [Discovery] = [Discovery(id: "point1",
                                             name: "Bondebjergvej",
                                             imageUrlString: nil,
                                             description: nil,
                                             location: (55.489604, 11.687599),
                                             clip: SoundClip(urlString: "gyr_dp1_h")),
                                   Discovery(id: "point2",
                                             name: "Gyrstingevej",
                                             imageUrlString: nil,
                                             description: nil,
                                             location: (55.487793, 11.692250),
                                             clip: SoundClip(urlString: "gyr_dp2_h")),
                                   Discovery(id: "point3",
                                             name: "Gyrstinge Bygade",
                                             imageUrlString: nil,
                                             description: nil,
                                             location: (55.484490, 11.682670),
                                             clip: SoundClip(urlString: "gyr_dp3_h")),
                                   Discovery(id: "point4",
                                             name: "Præstegårdssegmentet",
                                             imageUrlString: nil,
                                             description: nil,
                                             location: (55.486243, 11.682479),
                                             clip: SoundClip(urlString: "gyr_dp4_h")),
                                   Discovery(id: "point5",
                                             name: "Gyrstinge Skole",
                                             imageUrlString: nil,
                                             description: nil,
                                             location: (55.488118, 11.685339),
                                             clip: SoundClip(urlString: "gyr_dp5_h"))]
        
        //Load local route
        let routeUrl = Bundle.main.url(forResource: "gyrstingetestride", withExtension: "xml")
        let parser = MyParser(url: routeUrl!)
        let route = parser.parseXML()
        
        let cast = Cast(id: "666",
                        name: "Gyrstinge Test",
                        description: "Rundt i Gyrstinge",
                        imageUrlString: "nordgrus",
                        region: "Midtsjælland",
                        discoveryPoints: points,
                        stravaRoute: route)
        
        return cast
    }
}
