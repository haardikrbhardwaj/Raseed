import Foundation
import AuthenticationServices

final class NotionOAuthManager: NSObject {

    static let shared = NotionOAuthManager()

    private var authSession: ASWebAuthenticationSession?

    func startOAuthFlow() {

        let url = NotionOAuthService.shared.loginURL()

        authSession = ASWebAuthenticationSession(
            url: url,
            callbackURLScheme: "raseed"
        ) { callbackURL, error in

            if let error = error {
                print("OAuth Error:", error.localizedDescription)
                return
            }

            guard let callbackURL else {
                return
            }

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
            
            self.exchangeCodeWithVercel(code: code)
        }

        authSession?.presentationContextProvider = self
        authSession?.prefersEphemeralWebBrowserSession = true
        authSession?.start()
    }
    
    private func exchangeCodeWithVercel(code: String) {
        guard let url = URL(string: "https://raseed-backend.vercel.app/api/auth/token") else {
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let body: [String: String] = ["code": code]
        guard let jsonData = try? JSONSerialization.data(withJSONObject: body) else { return }
        request.httpBody = jsonData
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Exchange failed:", error.localizedDescription)
                return
            }
            
            guard let data = data else { return }
            
            do {
                if let json = try JSONSerialization.jsonObject(with: data) as? [String: Any] {
                    if let accessToken = json["access_token"] as? String {
                        UserDefaults.standard.set(accessToken, forKey: "notion_access_token")
                        
                        if let databaseId = json["duplicated_template_id"] as? String {
                            UserDefaults.standard.set(databaseId, forKey: "notion_database_id")
                        }
                    }
                }
            } catch {
                print("Failed to decode token:", error.localizedDescription)
            }
        }.resume()
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
