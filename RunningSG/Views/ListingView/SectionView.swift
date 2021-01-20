//
//  SectionView.swift
//  RunningSG
//
//  Created by Benoit PASQUIER on 25/11/2020.
//

import SwiftUI

struct SectionView: View {

    let sectionRoute: SectionRoute

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {

            Text(sectionRoute.title)
                .font(.title2)
                .foregroundColor(.white)
                .padding(.leading, 20)

            ScrollView(.horizontal) {
                LazyHStack(spacing: 0) {
                    ForEach(0..<sectionRoute.routes.count, id: \.self) { index in
                        
                        NavigationLink(
                            destination: DetailView(route: sectionRoute.routes[index])) {
                                CardView(route: sectionRoute.routes[index])
                            }.accessibility(identifier: "CardViews")
                    }
                }
            }
            .frame(height: 300)

        }
        .padding(.top, 20)
        .listRowBackground(Color.clear)
        .listRowInsets(EdgeInsets())
    }
}


struct SectionView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            SectionView(sectionRoute: SectionRoute.mock)
                .environment(\.locale, locale)
        }
    }
}
