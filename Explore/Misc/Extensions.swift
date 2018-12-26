//
//  Extensions.swift
//  Explore
//
//  Created by Christian Graver on 20/12/2018.
//  Copyright © 2018 nordgrus. All rights reserved.
//

import Foundation

// MARK: - Collection -
extension Collection {
    
    /// Returns the element at the specified index iff it is within bounds, otherwise nil.
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
