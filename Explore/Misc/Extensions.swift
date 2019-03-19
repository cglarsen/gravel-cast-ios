//
//  Extensions.swift
//  Explore
//
//  Created by Christian Graver on 20/12/2018.
//  Copyright © 2018 nordgrus. All rights reserved.
//

import Foundation
import CoreLocation
import UIKit

// MARK: - UIButton -
extension UIButton{
    func addText(spacing: CGFloat){
        guard let title = self.titleLabel?.text else { return }
        let attributedString = NSMutableAttributedString(string: title)
        attributedString.addAttribute(NSAttributedString.Key.kern,
                                      value: spacing,
                                      range: NSRange(location: 0, length: (title.count)))
        self.setAttributedTitle(attributedString, for: .normal)
    }
}

// MARK: - Collection -
extension Collection {
    
    /// Returns the element at the specified index iff it is within bounds, otherwise nil.
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
// MARK: - CLLocation -
extension CLLocation {
    
    /// Get distance between two points
    ///
    /// - Parameters:
    ///   - from: first point
    ///   - to: second point
    /// - Returns: the distance in meters
    class func distance(from: CLLocationCoordinate2D, to: CLLocationCoordinate2D) -> CLLocationDistance {
        let from = CLLocation(latitude: from.latitude, longitude: from.longitude)
        let to = CLLocation(latitude: to.latitude, longitude: to.longitude)
        return from.distance(from: to)
    }
}
