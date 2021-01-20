//
//  DateFormatter.swift
//  RunningSG
//
//  Created by Benoit Pasquier on 18/12/20.
//

import Foundation

protocol DateComponentsFormatterProtocol {
    var unitsStyle: DateComponentsFormatter.UnitsStyle { get set }
    var allowedUnits: NSCalendar.Unit { get set }
    func string(from ti: TimeInterval) -> String?
}

extension DateComponentsFormatter: DateComponentsFormatterProtocol { }

struct PreviewDateComponentsFormatter: DateComponentsFormatterProtocol {
    private let locale: Locale
    private let formatter: DateComponentsFormatter

    init(locale: Locale) {
        self.locale = locale
        self.formatter = DateComponentsFormatter()

        var calendar = Calendar.current
        calendar.locale = locale
        self.formatter.calendar = calendar
    }

    var unitsStyle: DateComponentsFormatter.UnitsStyle {
        get {
            formatter.unitsStyle
        }
        set {
            formatter.unitsStyle = newValue
        }
    }

    var allowedUnits: NSCalendar.Unit {
        get {
            formatter.allowedUnits
        }
        set {
            formatter.allowedUnits = newValue
        }
    }

    func string(from ti: TimeInterval) -> String? {
        return formatter.string(from: ti)
    }
}
