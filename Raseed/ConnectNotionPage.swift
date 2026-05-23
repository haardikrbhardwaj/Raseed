//
//  ConnectNotionPage.swift
//  Raseed
//

import SwiftUI

struct ConnectNotionPage: View {
    
    var onConnect: () -> Void
    var onSkip: () -> Void
    
    var body: some View {
        VStack(spacing: 32) {
            
            Spacer()
            
            // App Icons Connection Header (Replaced standard system arrow)
            HStack(spacing: 20) {
                // 1. Raseed App Icon
                Image("Raseedicon")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 72, height: 72)
                    .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                    .shadow(color: .yellow.opacity(0.2), radius: 10)
                
                // Connection Link Arrow
                Image(systemName: "arrow.left.and.right")
                    .font(.title2.bold())
                    .foregroundStyle(.yellow)
                
                // 2. Notion Workspace Icon
                Image("Unknown")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 72, height: 72)
                    .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                    .shadow(color: .white.opacity(0.05), radius: 10)
            }
            .padding(.bottom, 10)
            
            VStack(spacing: 14) {
                Text(LocalizedStringKey("connect_workspace"))
                    .font(.system(size: 34, weight: .bold))
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.center)
                
                Text(LocalizedStringKey("notion_sync_desc"))
                    .font(.system(size: 16))
                    .foregroundStyle(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 16)
            }
            
            // Micro pill tags
            VStack(spacing: 12) {
                PillTag(titleKey: "cloud_backup")
                PillTag(titleKey: "cross_device")
                PillTag(titleKey: "ai_insights")
            }
            
            Spacer()
            
            // Lower Call to Actions Group
            VStack(spacing: 18) {
                Button {
                    onConnect()
                } label: {
                    HStack(spacing: 12) {
                        Image("Unknown")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                            .clipShape(RoundedRectangle(cornerRadius: 5, style: .continuous))
                        
                        Text(LocalizedStringKey("connect_notion_btn"))
                            .font(.headline)
                            .foregroundStyle(.black)
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 58)
                    .background(Color.yellow)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                }
                
                Button {
                    onSkip()
                } label: {
                    Text(LocalizedStringKey("continue_offline"))
                        .font(.subheadline.weight(.medium))
                        .foregroundStyle(.gray)
                        .padding(.vertical, 8)
                }
            }
            .padding(.horizontal, 24)
            .padding(.bottom, 30)
        }
    }
}

struct PillTag: View {
    let titleKey: String
    
    var body: some View {
        Text(LocalizedStringKey(titleKey))
            .font(.system(size: 15, weight: .medium))
            .foregroundStyle(.white)
            .padding(.horizontal, 20)
            .padding(.vertical, 10)
            .background(Color.white.opacity(0.07))
            .clipShape(Capsule())
    }
}
