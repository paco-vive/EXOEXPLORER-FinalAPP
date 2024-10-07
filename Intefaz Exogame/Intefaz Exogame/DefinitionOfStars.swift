//
//  DefinitionOfStars.swift
//  Intefaz Exogame
//
//  Created by iOS Lab on 05/10/24.
//

import Foundation
import SwiftUI

import CoreGraphics

struct Star: Identifiable, Equatable, Hashable {
    let id = UUID()
    var position: CGPoint
    
    // If you're using an older version of Swift where CGPoint is not Hashable
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(position.x)
        hasher.combine(position.y)
    }
    
    // Equatable implementation, which is required for Hashable
    static func ==(lhs: Star, rhs: Star) -> Bool {
        return lhs.id == rhs.id && lhs.position == rhs.position
    }
}
struct trapStar: Identifiable, Equatable, Hashable {
    let id = UUID()
    var position: CGPoint
    
    // If you're using an older version of Swift where CGPoint is not Hashable
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(position.x)
        hasher.combine(position.y)
    }
    }



struct Constellation {
    var name: String
    var stars: [Star] // Estrellas correctas
    var trapStars: [Star] // Estrellas trampa
    var connections: [(from: Star, to: Star)]
}


