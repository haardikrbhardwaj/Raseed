//
//  SupabaseManager.swift
//  Raseed
//
//  Created by Hardik Bhardwaj on 22/05/26.
//


import Foundation
import Supabase

final class SupabaseManager {

    static let shared = SupabaseManager()

    let client = SupabaseClient(
        supabaseURL: URL(string: "YOUR_SUPABASE_URL")!,
        supabaseKey: "YOUR_SUPABASE_ANON_KEY"
    )
}
