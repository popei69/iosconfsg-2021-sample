//
//  Image+Extensions.swift
//  RunningSG
//
//  Created by Benoit PASQUIER on 01/12/2020.
//

import SwiftUI

extension Image {
    func centerCropped() -> some View {
        GeometryReader { geo in
            self
            .resizable()
            .scaledToFill()
            .frame(width: geo.size.width, height: geo.size.height)
            .clipped()
        }
    }
}
