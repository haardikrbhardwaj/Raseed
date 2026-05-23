import Foundation
import AuthenticationServices

final class NotionOAuthManager: NSObject {

    static let shared = NotionOAuthManager()

    private var authSession: ASWebAuthenticationSession?

    func startOAuthFlow() {

        let url = NotionOAuthService.shared.loginURL()

        authSession = ASWebAuthenticationSession(
            url: url,
            callbackURLScheme: "expenzo"
        ) { callbackURL, error in

            if let error = error {

                print("OAuth Error:", error.localizedDescription)
                return
            }

            guard let callbackURL else {
                return
            }

            print("Callback URL:", callbackURL)

            guard
                let components = URLComponents(
                    url: callbackURL,
                    resolvingAgainstBaseURL: false
                ),
                let code = components.queryItems?
                    .first(where: { $0.name == "code" })?
                    .value
            else {
                print("No OAuth code found")
                return
            }

            print("OAuth Code:", code)

            // NEXT STEP:
            // Send code to backend server
        }

        authSession?.presentationContextProvider = self
        authSession?.prefersEphemeralWebBrowserSession = true
        authSession?.start()
    }
}

extension NotionOAuthManager:
ASWebAuthenticationPresentationContextProviding {

    func presentationAnchor(
        for session: ASWebAuthenticationSession
    ) -> ASPresentationAnchor {

        UIApplication.shared.connectedScenes
            .compactMap { $0 as? UIWindowScene }
            .first?
            .windows
            .first ?? UIWindow()
    }
}
