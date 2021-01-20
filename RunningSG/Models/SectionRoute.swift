//
//  SectionRoute.swift
//  RunningSG
//
//  Created by Benoit PASQUIER on 30/11/2020.
//

import Foundation

struct SectionRoute: Identifiable {
    let id: UUID
    let title: String
    let routes: [Route]
    
    init(title: String, routes: [Route]) {
        self.id = UUID()
        self.title = title
        self.routes = routes
    }
}

extension SectionRoute {
    static let mock = Self(title: "Favorite Routes", 
                           routes: [Route.mock, Route.mock, Route.mock])
}
