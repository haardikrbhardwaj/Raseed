import SwiftUI
import SwiftData


struct SyncSpendApp: App {

    var body: some Scene {

        WindowGroup {

            RootView()

                .preferredColorScheme(.dark)

                .onOpenURL { url in

                    guard let components = URLComponents(
                        url: url,
                        resolvingAgainstBaseURL: false
                    ) else {
                        return
                    }

                    let code = components.queryItems?
                        .first(where: { $0.name == "code" })?
                        .value

                    print("OAuth Code:", code ?? "")
                }
        }
        .modelContainer(for: Expense.self)
    }
}
