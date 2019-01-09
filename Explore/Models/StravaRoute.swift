//
//  StravaRoute.swift
//  Explore
//
//  Created by Christian Graver on 26/12/2018.
//  Copyright © 2018 nordgrus. All rights reserved.
//

import Foundation

class StravaCoordinate {
    var lat: String
    var lon: String
    
    init?(dictionary: [String : String]) {
        guard let lat = dictionary["lat"],
                let lon = dictionary["lon"] else {
            return nil
        }
        self.lat = lat
        self.lon = lon
    }
}

class StravaRoute {
    //var name: String
    //var routeLink: String
    var coordinates = [StravaCoordinate]()
    
    init(coordinates: [StravaCoordinate]) {
        self.coordinates = coordinates
    }
}

class MyParser: NSObject {
    var parser: XMLParser
    
    var route: StravaRoute?
    private var coordinates = [StravaCoordinate]()
    
    init(xml: String) {
        parser = XMLParser(data: xml.data(using: String.Encoding.utf8)!)
        super.init()
        parser.delegate = self
    }
    
    init(url: URL) {
        parser = XMLParser(contentsOf: url)!
        super.init()
        parser.delegate = self
    }
    
    func parseXML() -> StravaRoute? {
        parser.parse()
        return route
    }
    
}

extension MyParser: XMLParserDelegate {
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String]) {
        //rint("elementName: \(elementName), namespaceURI: \(namespaceURI), qName: \(qName), attributed: \(attributeDict)")
        
        if elementName == "trkpt" {
            if let coor = StravaCoordinate(dictionary: attributeDict) {
                self.coordinates.append(coor)
            }
        }
    }
    
    func parserDidEndDocument(_ parser: XMLParser) {
        self.route = StravaRoute(coordinates: self.coordinates)
    }
}
