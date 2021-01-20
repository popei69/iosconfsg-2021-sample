//
//  Route.swift
//  RunningSG
//
//  Created by Benoit PASQUIER on 30/11/2020.
//

import Foundation

struct Route: Identifiable {
    let id: UUID
    let title: String
    let imageName: String
    let distance: Double
    
    // lng, lat
    let startingPointDistance: Double
    
    init(title: String, imageName: String, distance: Double = 21.1, startingPointDistance: Double = 300) {
        self.id = UUID()
        self.title = title
        self.imageName = imageName
        self.distance = distance
        self.startingPointDistance = startingPointDistance
    }
}

extension Route {
    static let mock = Self(title: "Marina Barrage", imageName: "marina-barrage")
    static let directions: [String] = ["⬆️", "⬇️", "↗️", "↘️", "↙️", "↖️", "➡️", "⬅️"]
    
    var direction: String { Route.directions[5] }
    var bestTime: TimeInterval { TimeInterval(1423) }
    var pace: TimeInterval { TimeInterval(265) }
}
