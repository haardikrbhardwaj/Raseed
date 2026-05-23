//import SwiftUI
//import SwiftData
//
//@main
//struct RaseedApp: App {
//
//    var body: some Scene {
//
//        WindowGroup {
//
//            RootView()
//                .preferredColorScheme(.dark)
//
//                .onOpenURL { url in
//
//                    guard let components = URLComponents(
//                        url: url,
//                        resolvingAgainstBaseURL: false
//                    ) else {
//                        return
//                    }
//
//                    let code = components.queryItems?
//                        .first(where: { $0.name == "code" })?
//                        .value
//
//                    print("OAuth Code:", code ?? "")
//                }
//        }
//        .modelContainer(for: Expense.self)
//    }
//}

//
//  RaseedApp.swift
//  Raseed
//

import SwiftUI
import SwiftData

@main
struct RaseedApp: App {

    @StateObject
    private var languageManager =
    LanguageManager.shared

    var sharedModelContainer: ModelContainer = {

        let schema = Schema([
            Expense.self
        ])

        let modelConfiguration =
        ModelConfiguration(
            schema: schema,
            isStoredInMemoryOnly: false
        )

        do {

            return try ModelContainer(
                for: schema,
                configurations: [modelConfiguration]
            )

        } catch {

            fatalError(
                "Could not create ModelContainer: \(error)"
            )
        }
    }()

    var body: some Scene {

        WindowGroup {

            RootView()
                .environment(
                    \.locale,
                     Locale(
                        identifier:
                        languageManager.selectedLanguage
                     )
                )
        }
        .modelContainer(sharedModelContainer)
    }
}
