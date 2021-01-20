//
//  SampleView.swift
//  RunningSG
//
//  Created by Benoit PASQUIER on 22/12/2020.
//

import SwiftUI

struct SampleView: View {
    let formatter: DateComponentsFormatter
    
    init() {
        self.formatter = DateComponentsFormatter()
        self.formatter.allowedUnits = [.hour, .minute, .second]
        
    }
    var body: some View {
        VStack(spacing: 20) {
            VStack {
                Text("Hello iOS Conf SG")
                Button("Let's go!", action: { })
            }
            
            VStack {
                Text(Date(), style: .date)
                Text(Date(), formatter: formatter)
            }
        }
    }
}

struct SampleView_Previews: PreviewProvider {
    static var previews: some View {
        SampleView()
            .environment(\.locale, locale)
    }
}
