//
//  RunningWidget.swift
//  RunningWidget
//
//  Created by Benoit Pasquier on 1/12/20.
//

import WidgetKit
import SwiftUI
import Intents

struct Provider: IntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: ConfigurationIntent())
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), configuration: configuration)
        completion(entry)
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, configuration: configuration)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationIntent
    let lengthFormatter: LengthFormatterProtocol
    
    init(date: Date, configuration: ConfigurationIntent, lengthFormatter: LengthFormatterProtocol = LengthFormatter()) {
        self.date = date
        self.configuration = configuration
        self.lengthFormatter = lengthFormatter
    }
}

struct MiniCardView: View {
    let route: Route
    let title: LocalizedStringKey
    let lengthFormatter: LengthFormatterProtocol
    
    init(route: Route, title: LocalizedStringKey, lengthFormatter: LengthFormatterProtocol = LengthFormatter()) {
        self.route = route
        self.title = title
        self.lengthFormatter = lengthFormatter
    }
    
    var startingPoint: String {
        guard let direction = Route.directions.randomElement() else {
            return ""
        }
        
        return "\(direction)  \(lengthFormatter.string(fromValue: route.startingPointDistance, unit: .meter, unitStyle: .short))" 
    }

    var body: some View {

        ZStack(alignment: Alignment(horizontal: .leading, vertical: .top)) {
            Image(route.imageName)
                .centerCropped()
                .overlay(Color.black.opacity(0.3))

            HStack(alignment: .center) {
                Text(title)
                    .font(.headline)
                    .foregroundColor(.white)

                Spacer()

                // TODO translate
                Text(startingPoint)
                    .font(.callout)
                    .padding(10)
                    .background(Color.init(white: 0, opacity: 0.4))
                    .cornerRadius(20)
                    .foregroundColor(.white)

            }
            .padding(.horizontal, 10)
            .padding(.vertical, 8)
        }
    }
}

struct RunningWidgetEntryView : View {
    @Environment(\.widgetFamily) var family: WidgetFamily
    var entry: Provider.Entry
    var section: SectionRoute

    var route: Route {
        section.routes.randomElement() ?? .mock
    }

    var body: some View {
        switch family {
        case .systemMedium: MiniCardView(route: route, title: "Favorite Routes", lengthFormatter: entry.lengthFormatter)
        case .systemSmall: MiniCardView(route: route, title: "", lengthFormatter: entry.lengthFormatter)
        case .systemLarge: Text("TODO")
        @unknown default:
            fatalError()
        }
    }
}

@main
struct RunningWidget: Widget {
    let kind: String = "RunningWidget"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            RunningWidgetEntryView(entry: entry, section: .mock)
        }
        .configurationDisplayName("My Running Widget")
        .description("A step ahead of your next run")
        .supportedFamilies([.systemSmall, .systemMedium])
    }
}

struct RunningWidget_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            RunningWidgetEntryView(entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent(), lengthFormatter: lengthFormatter), 
                                   section: .mock)
                .previewContext(WidgetPreviewContext(family: .systemMedium))
            
            RunningWidgetEntryView(entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent(), lengthFormatter: lengthFormatter), 
                                   section: .mock)
                .previewContext(WidgetPreviewContext(family: .systemSmall))
        }.environment(\.locale, locale)
    }
}
