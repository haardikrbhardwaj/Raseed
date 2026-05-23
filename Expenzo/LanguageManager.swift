//  LanguageManager.swift
//  Raseed

import Foundation
import SwiftUI
import Combine

final class LanguageManager: ObservableObject {

    static let shared = LanguageManager()

    @Published var selectedLanguage: String

    init() {
        self.selectedLanguage = UserDefaults.standard.string(
            forKey: "selectedLanguage"
        ) ?? "en"

        // Apply saved language on app launch
        let saved = UserDefaults.standard.string(forKey: "selectedLanguage") ?? "en"
        Bundle.setLanguage(saved)
    }

    func setLanguage(_ code: String) {
        selectedLanguage = code
        UserDefaults.standard.set(code, forKey: "selectedLanguage")
        Bundle.setLanguage(code)
    }
}

// MARK: - Bundle swapping

private var bundleKey = "BundleKey"

final class BundleEx: Bundle, @unchecked Sendable {

    override func localizedString(
        forKey key: String,
        value: String?,
        table tableName: String?
    ) -> String {

        guard let path = objc_getAssociatedObject(
            self,
            &bundleKey
        ) as? Bundle else {
            return super.localizedString(
                forKey: key,
                value: value,
                table: tableName
            )
        }

        return path.localizedString(
            forKey: key,
            value: value,
            table: tableName
        )
    }
}

extension Bundle {

    static func setLanguage(_ language: String) {

        // Swap Bundle.main with our custom subclass once
        object_setClass(Bundle.main, BundleEx.self)

        // Try exact match first e.g. "en-IN", then base code e.g. "en"
        let base = String(language.split(separator: "-").first ?? "en")

        let path = Bundle.main.path(forResource: language, ofType: "lproj")
            ?? Bundle.main.path(forResource: base, ofType: "lproj")
            ?? Bundle.main.path(forResource: "en", ofType: "lproj")!

        let languageBundle = Bundle(path: path)

        objc_setAssociatedObject(
            Bundle.main,
            &bundleKey,
            languageBundle,
            .OBJC_ASSOCIATION_RETAIN_NONATOMIC
        )
    }
}
