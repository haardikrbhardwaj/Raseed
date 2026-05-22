//
//  NotionOAuthService.swift
//  Raseed
//
//  Created by Hardik Bhardwaj on 22/05/26.
//


import Foundation

final class NotionOAuthService {

    static let shared = NotionOAuthService()

    func loginURL() -> URL {

        let base = "https://api.notion.com/v1/oauth/authorize"

        let url = "\(base)?owner=user&client_id=\(NotionConfig.clientID)&response_type=code&redirect_uri=\(NotionConfig.redirectURI)"

        return URL(string: url)!
    }
}