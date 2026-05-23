import Foundation

final class NotionOAuthService {

    static let shared = NotionOAuthService()

    func loginURL() -> URL {

        let redirect =
        NotionConfig.redirectURI.addingPercentEncoding(
            withAllowedCharacters: .urlQueryAllowed
        ) ?? ""

        let urlString =
        """
        \(NotionConfig.authURL)?\
        owner=user&\
        client_id=\
        \(NotionConfig.clientID)&\
        response_type=code&\
        redirect_uri=\(redirect)
        """
        .replacingOccurrences(of: "\n", with: "")

        return URL(string: urlString)!
    }
}
