//
//  AppRoute.swift
//  RunningSG
//
//  Created by Benoit PASQUIER on 30/11/2020.
//

import Foundation

struct AppRoute {
    let sections: [SectionRoute]
}

extension AppRoute {
    // Mock data for testing Xcode Preview
    static let mock = Self(sections: [
        SectionRoute(title: "Favorite Routes", routes: [Route.mock, Route.mock, Route.mock]),
        SectionRoute(title: "Sunrise Routes", routes: [Route.mock, Route.mock, Route.mock]),
        SectionRoute(title: "Last Added Routes", routes: [Route.mock, Route.mock, Route.mock]),
        SectionRoute(title: "Park Routes", routes: [Route.mock, Route.mock, Route.mock])
    ])
    
    // Mock data for demo, no backend or database used
    static let live = Self(sections: [
        SectionRoute(title: "Last Added Routes", routes: [
                        Route(title: "Marina Barrage", imageName: "marina-barrage", distance: 15.0),
                        Route(title: "Kallang Riverside", imageName: "kallang", distance: 6.6),
                        Route(title: "Geylang River", imageName: "geylang-river", distance: 5.5)]),
        SectionRoute(title: "Sunrise Routes", routes: [
                        Route(title: "Geylang River", imageName: "geylang-river", distance: 5.5),
                        Route(title: "Marina East", imageName: "marina-east", distance: 12.5),
                        Route(title: "Ang Mo Kio Park", imageName: "angmohkio-park", distance: 10.5)]),
        SectionRoute(title: "Night Scenery", routes: [
                        Route(title: "Marina Barrage", imageName: "marina-barrage", distance: 15.0),
                        Route(title: "Raffles Place", imageName: "raffles-place", distance: 6.3),
                        Route(title: "Kallang Riverside", imageName: "kallang")])
    ])
}
