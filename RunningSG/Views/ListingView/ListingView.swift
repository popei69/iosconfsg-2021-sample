//
//  ContentView.swift
//  RunningSG
//
//  Created by Benoit PASQUIER on 23/11/2020.
//

import SwiftUI

struct ListingView: View {
    
    let appRoute: AppRoute
    
    init(appRoute: AppRoute) {
        self.appRoute = appRoute
        UITableView.appearance().backgroundColor = .clear
        UITableViewCell.appearance().backgroundColor = .clear
        UITableView.appearance().separatorStyle = .none

        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        UINavigationBar.appearance().barStyle = .black
    }
    
    var body: some View {
        NavigationView {
             ZStack {

                Color.black
                    .edgesIgnoringSafeArea(.all)

                List {
                    ForEach(appRoute.sections) { section in
                        SectionView(sectionRoute: section)
                    }
                }
                .listStyle(PlainListStyle())

            }
             .navigationTitle(Translation.singapore)
             .navigationBarItems(trailing: 
                                    Button(Translation.add, action: { })
                                    .foregroundColor(.white)
             )
        }
    }
}

struct ListingView_Previews: PreviewProvider {
    static var previews: some View {
        ListingView(appRoute: .mock)
            .environment(\.locale, locale)
    }
}
