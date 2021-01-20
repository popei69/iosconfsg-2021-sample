//
//  LenghtFormatter.swift
//  RunningSG
//
//  Created by Benoit PASQUIER on 30/11/2020.
//

import Foundation

protocol LengthFormatterProtocol {
    var numberFormatter: NumberFormatter! { get set }
    func string(fromValue value: Double, unit: LengthFormatter.Unit) -> String
    func string(fromValue value: Double, unit: LengthFormatter.Unit, unitStyle: Formatter.UnitStyle) -> String
}

extension LengthFormatter: LengthFormatterProtocol {  
    func string(fromValue value: Double, unit: Unit, unitStyle: Formatter.UnitStyle) -> String {
        self.unitStyle = unitStyle
        return string(fromValue: value, unit: unit)
    }
}

struct PreviewLengthFormatter: LengthFormatterProtocol {
    
    private let locale: Locale
    private let formatter: LengthFormatter
    
    init(locale: Locale) {
        self.locale = locale
        self.formatter = LengthFormatter()
        
        setupFormatter()
    }
    
    var numberFormatter: NumberFormatter! {
        get {
            formatter.numberFormatter
        }
        set {
            formatter.numberFormatter = newValue
        }
    }
    
    func setupFormatter() {
        formatter.unitStyle = .short
        formatter.numberFormatter.locale = locale
    }
    
    func string(fromValue value: Double, unit: LengthFormatter.Unit) -> String {
        return formatter.string(fromValue: value, unit: unit)
    }
    
    func string(fromValue value: Double, unit: LengthFormatter.Unit, unitStyle: Formatter.UnitStyle) -> String {
        return formatter.string(fromValue: value, unit: unit, unitStyle: unitStyle)
    }
}
