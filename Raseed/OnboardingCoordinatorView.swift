//
//  OnboardingCoordinatorView.swift
//  Raseed
//
//  Created by Hardik Bhardwaj on 23/05/26.
//

import SwiftUI

struct OnboardingCoordinatorView: View {
    
    @AppStorage("hasCompletedOnboarding")
    private var hasCompletedOnboarding = false
    
    @AppStorage("hasConnectedNotion")
    private var hasConnectedNotion = false
    
    @AppStorage("isOfflineMode")
    private var isOfflineMode = false
    
    @State private var currentPage = 0
    @StateObject private var languageManager = LanguageManager.shared
    
    private let totalPages = 6
    
    var body: some View {
        ZStack {
            // 1. Background
            LinearGradient(
                colors: [
                    Color.black,
                    Color(.sRGB, red: 0.12, green: 0.12, blue: 0.12, opacity: 1)
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            VStack(spacing: 0) {
                // 2. Segmented Progress Bar
                HStack(spacing: 6) {
                    ForEach(0..<totalPages, id: \.self) { index in
                        Capsule()
                            .frame(height: 4)
                            .foregroundStyle(
                                index <= currentPage
                                ? Color.white
                                : Color.white.opacity(0.2)
                            )
                            .animation(.spring(), value: currentPage)
                    }
                }
                .padding(.horizontal, 24)
                .padding(.top, 10)
                
                // 3. Main Content (Swipeable)
                TabView(selection: $currentPage) {
                    WelcomePage(currentPage: $currentPage)
                        .tag(0)
                    
                    LanguageSelectionPage(currentPage: $currentPage)
                        .tag(1)
                    
                    NameInputPage(currentPage: $currentPage)
                        .tag(2)
                    
                    BenefitsPage(currentPage: $currentPage)
                        .tag(3)
                    
                    HowItWorksPage(currentPage: $currentPage)
                        .tag(4)
                    
                    ConnectNotionPage(
                        onConnect: {
                            hasConnectedNotion = true
                            hasCompletedOnboarding = true
                            NotionOAuthManager.shared.startOAuthFlow()
                        },
                        onSkip: {
                            isOfflineMode = true
                            hasCompletedOnboarding = true
                        }
                    )
                    .tag(5)
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
            }
        }
        // Force re-renders every time the locale updates in real-time
        .id(languageManager.selectedLanguage)
        // Global hook to dismiss the keyboard immediately if the page index transitions away from input
        .onChange(of: currentPage) { oldPage, newPage in
            if oldPage == 2 && newPage != 2 {
                dismissKeyboard()
            }
        }
    }
    
    // Helper function to force application window to drop keyboard focus
    private func dismissKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
