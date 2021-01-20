//
//  RunningSGApp.swift
//  RunningSG
//
//  Created by Benoit PASQUIER on 23/11/2020.
//

import SwiftUI

@main
struct RunningSGApp: App {
    var body: some Scene {
        WindowGroup {
            ListingView(appRoute: AppRoute.live)
        }
    }
}
