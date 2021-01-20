//
//  DetailView.swift
//  RunningSG
//
//  Created by Benoit PASQUIER on 14/12/2020.
//

import MapKit
import SwiftUI

struct DetailView: View {
    let route: Route
    let lengthFormatter: LengthFormatterProtocol
    var dateComponentsFormatter: DateComponentsFormatterProtocol
    
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 1.2847, longitude: 103.8610), span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
    
    init(route: Route,
         lengthFormatter: LengthFormatterProtocol = LengthFormatter(),
         dateComponentsFormatter: DateComponentsFormatterProtocol = DateComponentsFormatter()) {
        self.route = route
        self.lengthFormatter = lengthFormatter
        self.dateComponentsFormatter = dateComponentsFormatter

        self.dateComponentsFormatter.allowedUnits = [.hour, .minute, .second]
        self.dateComponentsFormatter.unitsStyle = .abbreviated
    }
    
    private var startingPoint: String {
        guard let direction = Route.directions.randomElement() else {
            return ""
        }
        
        return "\(direction) - \(lengthFormatter.string(fromValue: route.startingPointDistance, unit: .meter, unitStyle: .short))" 
    } 
    
    private var distanceValue: String {
        return lengthFormatter.string(fromValue: route.distance, unit: .kilometer, unitStyle: .long)
    }
    
    private var timeValue: String {
        return dateComponentsFormatter.string(from: route.bestTime) ?? "-"
    }
    
    private var paceValue: String {
        return dateComponentsFormatter.string(from: route.pace) ?? "-"
    }

    var body: some View {
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .top)) {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    
                    Image(route.imageName)
                        .centerCropped()
                        .overlay(Color.black.opacity(0.3))
                        .frame(height: 400)
                        .cornerRadius(20)
                    
                    VStack(alignment: .leading, spacing: 12) {

                        HStack(spacing: 10) {
                            Text(Translation.distance)
                                .foregroundColor(.white)
                            
                            Spacer()
                            
                            Text(distanceValue)
                                .foregroundColor(.white)
                        }

                        HStack(spacing: 10) {
                            Text(Translation.bestTime)
                                .foregroundColor(.white)
                            
                            Spacer()
                            
                            Text(timeValue)
                                .foregroundColor(.white)
                        }

                        HStack(spacing: 10) {
                            Text(Translation.pace)
                                .foregroundColor(.white)
                            
                            Spacer()
                            
                            Text(paceValue)
                                .foregroundColor(.white)
                        }
                        
                        HStack(spacing: 10) {
                            Text(Translation.lastRun)
                                .foregroundColor(.white)
                            
                            Spacer()
                            
                            Text(Date(), style: .date)
                                .foregroundColor(.white)
                        }

                        HStack(spacing: 10) {
                            Text(Translation.startingDistance)
                                .foregroundColor(.white)

                            Spacer()

                            Text(startingPoint)
                                .foregroundColor(.white)
                        }
                        
                        HStack(alignment: .center) {
                            VStack {
                                Text(Translation.startingPoint)
                                    .foregroundColor(.white)
                                Spacer()
                            }
                            
                            Spacer()
                            Map(coordinateRegion: $region)
                                .frame(width: 150, height: 150, alignment: .center)
                                .cornerRadius(20)
                        }
                    }.padding(.top, 20)
                    
                }.padding()
            }.accessibility(identifier: "Detail.ScrollView")
        }.navigationTitle(route.title)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(route: Route.mock,
                   lengthFormatter: lengthFormatter,
                   dateComponentsFormatter: dateComponentsFormatter
        ).environment(\.locale, locale)
    }
}
