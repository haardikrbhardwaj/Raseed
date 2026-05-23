//
//  AuthManager.swift
//  Raseed
//
//  Created by Hardik Bhardwaj on 22/05/26.
//


import Foundation
import Supabase
import AuthenticationServices
import Combine

@MainActor
final class AuthManager: ObservableObject {

    static let shared = AuthManager()

    @Published var user: User?

    func signInWithApple() async throws {

    }

    func signOut() async throws {

        try await SupabaseManager.shared.client.auth.signOut()
    }
}
