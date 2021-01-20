//
//  CardView.swift
//  RunningSG
//
//  Created by Benoit PASQUIER on 25/11/2020.
//

import SwiftUI

struct CardView: View {
    
    let route: Route
    let formatter: LengthFormatterProtocol
    
    init(route: Route, formatter: LengthFormatterProtocol = LengthFormatter()) {
        self.route = route
        self.formatter = formatter
        
        self.formatter.numberFormatter.maximumFractionDigits = 2
        self.formatter.numberFormatter.minimumFractionDigits = 1
    }
    
    var distanceValue: String {
        return formatter.string(fromValue: route.distance, unit: .kilometer, unitStyle: .long)
    }
    
    var startingPointValue: String {
        return formatter.string(fromValue: route.startingPointDistance, unit: .meter, unitStyle: .short)
    }
    
    var body: some View {
        ZStack {
            
            Image(route.imageName)
                .centerCropped()
                .overlay(Color.black.opacity(0.3))
            
            VStack {
                Spacer()
                
                HStack(alignment: .center) {
                    
                    VStack(alignment: .leading) {
                        Text(route.title)
                            .font(.headline)
                            .foregroundColor(.white)
                        
                        Text(distanceValue)
                            .font(.subheadline)
                            .foregroundColor(.white)
                        
                    }
                    
                    Spacer()

                    Text(startingPointValue)
                        .padding(10)
                        .background(Color.init(white: 0, opacity: 0.4))
                        .cornerRadius(20)
                        .foregroundColor(.white)
                }
                .padding(.horizontal, 10)
                .padding(.vertical, 5)
            }
        }
        .frame(width: 350, height: 300)
        .cornerRadius(20)
        .padding(.leading, 20)
        .listRowBackground(Color.clear)
        .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(route: Route.mock, 
                 formatter: lengthFormatter)
            .environment(\.locale, locale)
    }
}
