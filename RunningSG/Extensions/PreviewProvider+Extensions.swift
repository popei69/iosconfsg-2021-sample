//
//  PreviewProvider+Extensions.swift
//  RunningSG
//
//  Created by Benoit Pasquier on 18/12/20.
//

import SwiftUI

extension PreviewProvider {
    static var locale: Locale {
        Locale(identifier: "fr")
    }

    static var lengthFormatter: LengthFormatterProtocol {
        PreviewLengthFormatter(locale: locale)
    }

    static var dateComponentsFormatter: DateComponentsFormatterProtocol {
        PreviewDateComponentsFormatter(locale: locale)
    }
}

enum Translation {
    static let distance = LocalizedStringKey("Distance:")
    static let bestTime = LocalizedStringKey("Best time:")
    static let pace = LocalizedStringKey("Pace:")
    static let lastRun = LocalizedStringKey("Last run:")
    static let startingDistance = LocalizedStringKey("Starting distance:")
    static let startingPoint = LocalizedStringKey("Starting point:")
    
    static let singapore = LocalizedStringKey("Singapore")
    static let add = LocalizedStringKey("Add")
    
    static func helloWorld(_ name: String) -> LocalizedStringKey {
        return LocalizedStringKey("Hello, \(name)")
    }
    
    static func helloWorldAsString(_ name: String) -> String {
        return String.localizedStringWithFormat(NSLocalizedString("Hello %@", comment: ""), name)
    }
}
