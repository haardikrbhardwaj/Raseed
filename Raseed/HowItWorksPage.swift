//
//  HowItWorksPage.swift
//  Raseed
//

import SwiftUI

struct HowItWorksPage: View {
    
    @Binding var currentPage: Int
    
    var body: some View {
        
        VStack(spacing: 30) {
            
            Spacer()
            
            VStack(spacing: 14) {
                
                Text(LocalizedStringKey("breakdown"))
                    .font(.system(size: 34, weight: .bold))
                    .foregroundStyle(.white)
                
                Text(LocalizedStringKey("track_spending"))
                    .foregroundStyle(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
            }
            
            VStack(spacing: 16) {
                
                // 1. App Expense Logging Card (SF Symbol styled as an iOS icon container)
                FlowCard(
                    imageSource: .system(name: "plus.circle.fill"),
                    title: "add_expense",
                    subtitle: "track_spending"
                )
                
                Image(systemName: "arrow.down")
                    .font(.title2)
                    .foregroundStyle(.yellow)
                
                // 2. Notion Sync Card (Custom asset styled as an iOS icon container)
                FlowCard(
                    imageSource: .asset(name: "Unknown"),
                    title: "notion_sync",
                    subtitle: "coming_soon"
                )
            }
            .padding(.horizontal)
            
            Spacer()
            
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
    }
}

enum ImageSource {
    case system(name: String)
    case asset(name: String)
}

struct FlowCard: View {
    
    let imageSource: ImageSource
    let title: String
    let subtitle: String
    
    var body: some View {
        
        HStack(spacing: 18) {
            
            // Standardized squircle container block matching system layout proportions
            ZStack {
                RoundedRectangle(cornerRadius: 11, style: .continuous)
                    .fill(Color.white.opacity(0.06))
                    .frame(width: 46, height: 46)
                
                switch imageSource {
                case .system(let name):
                    Image(systemName: name)
                        .font(.title2)
                        .foregroundStyle(.yellow)
                    
                case .asset(let name):
                    Image(name)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 26, height: 26)
                        .clipShape(RoundedRectangle(cornerRadius: 6, style: .continuous))
                }
            }
            
            VStack(alignment: .leading, spacing: 6) {
                
                Text(LocalizedStringKey(title))
                    .font(.headline)
                    .foregroundStyle(.white)
                
                Text(LocalizedStringKey(subtitle))
                    .foregroundStyle(.gray)
            }
            
            Spacer()
        }
        .padding()
        .background(Color.white.opacity(0.05))
        .clipShape(RoundedRectangle(cornerRadius: 26))
    }
}
