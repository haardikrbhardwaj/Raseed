//
//  LanguageSelectionPage.swift
//  Raseed
//

import SwiftUI

struct LanguageSelectionPage: View {
    
    @Binding var currentPage: Int
    @StateObject private var languageManager = LanguageManager.shared
    
    // Kept in native scripts so users can find their language easily
    let languages = [
               ("English", "en"),
                ("हिन्दी", "hi"),
                ("मराठी", "mr"),
                ("ਪੰਜਾਬੀ", "pa"),
                ("తెలుగు", "te"),
                ("தமிழ்", "ta"),
                ("ಕನ್ನಡ", "kn"),
                ("ଓଡ଼ିଆ", "or"),
                ("اردو", "ur"),
                ("Español", "es"),
                ("Français", "fr"),
                ("Ελληνικά", "el")
    ]
    
    var body: some View {
        VStack(spacing: 0) {
            
            // 1. Header Section
            VStack(spacing: 12) {
                Text(LocalizedStringKey("choose_language"))
                    .font(.system(size: 34, weight: .bold))
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.center)
                
                Text(LocalizedStringKey("personalize_experience"))
                    .foregroundStyle(.gray)
                    .multilineTextAlignment(.center)
            }
            .padding(.top, 40)
            .padding(.horizontal, 24)
            
            // 2. Scrollable Selection Container
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 16) {
                    ForEach(languages, id: \.1) { language in
                        Button {
                            withAnimation(.easeInOut(duration: 0.2)) {
                                languageManager.setLanguage(language.1)
                            }
                        } label: {
                            HStack {
                                Text(language.0)
                                    .font(.headline)
                                    .foregroundStyle(.white)
                                
                                Spacer()
                                
                                if languageManager.selectedLanguage == language.1 {
                                    Image(systemName: "checkmark.circle.fill")
                                        .foregroundStyle(.yellow)
                                }
                            }
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 22)
                                    .fill(
                                        languageManager.selectedLanguage == language.1
                                        ? Color.yellow.opacity(0.15)
                                        : Color.white.opacity(0.05)
                                    )
                            )
                        }
                    }
                }
                .padding(.vertical, 30)
                .padding(.horizontal, 24)
            }
            
            // 3. Fixed Bottom Action Area
            VStack {
                Button {
                    currentPage += 1
                } label: {
                    Text(LocalizedStringKey("continue_button"))
                        .font(.headline)
                        .foregroundStyle(.black)
                        .frame(maxWidth: .infinity)
                        .frame(height: 58)
                        .background(Color.yellow)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                }
                .padding(.horizontal, 24)
                .padding(.bottom, 40)
            }
            .background(
                Color.black
                    .shadow(color: .black.opacity(0.8), radius: 10, y: -10)
                    .ignoresSafeArea()
            )
        }
    }
}
