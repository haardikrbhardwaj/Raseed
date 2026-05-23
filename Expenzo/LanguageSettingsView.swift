//
//  LanguageSettingsView.swift
//  Raseed
//
//  Created by Hardik Bhardwaj on 23/05/26.
//

import Foundation
import SwiftUI
import Combine

struct LanguageSettingsView: View {

    @StateObject
    private var languageManager = LanguageManager.shared

    // Updated to match your Xcode Project localization settings exactly
    let languages = [
                ("English (India)", "en-IN"),
                ("हिन्दी (Hindi)", "hi"),
                ("मराठी (Marathi)", "mr"),
                ("ਪੰਜਾਬੀ (Punjabi)", "pa"),
                ("తెలుగు (Telugu)", "te"),
                ("தமிழ் (Tamil)", "ta"),
                ("ಕನ್ನಡ (Kannada)", "kn"),
                ("ଓଡ଼ିଆ (Odia)", "or"),
                ("اردو (Urdu)", "ur"),
                ("English (English)", "en"),
                ("English (Australia)", "en-AU"),
                ("English (United Kingdom)", "en-GB"),
                ("中文 (香港) (Chinese (Hong Kong))", "zh-HK"),
                ("Français (French)", "fr"),
                ("Español (Spanish)", "es"),
                ("Ελληνικά (Greek)", "el")
    ]

    var body: some View {

        ZStack {

            Color.black
                .ignoresSafeArea()

            ScrollView {

                VStack(
                    alignment: .leading,
                    spacing: 18
                ) {

                    // Uses the localized string key for the header
                    Text("language")
                        .font(.largeTitle.bold())
                        .foregroundColor(.white)

                    ForEach(
                        languages,
                        id: \.1
                    ) { language in

                        Button {

                            languageManager.setLanguage(
                                language.1
                            )

                        } label: {

                            HStack {

                                Text(language.0)
                                    .foregroundColor(.white)

                                Spacer()

                                if languageManager.selectedLanguage
                                    == language.1 {

                                    Image(
                                        systemName:
                                            "checkmark.circle.fill"
                                    )
                                    .foregroundColor(.green)
                                }
                            }
                            .padding()
                            .background(AppColors.card)
                            .clipShape(
                                RoundedRectangle(
                                    cornerRadius: 20
                                )
                            )
                        }
                    }
                }
                .padding()
            }
        }
    }
}
