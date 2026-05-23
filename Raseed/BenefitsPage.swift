//
//  BenefitsPage.swift
//  Raseed
//

import SwiftUI

struct BenefitsPage: View {
    
    @Binding var currentPage: Int
    
    var body: some View {
        VStack(spacing: 0) {
            
            // Top Content
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 32) {
                    
                    VStack(spacing: 12) {
                        Text(LocalizedStringKey("why_use_raseed"))
                            .font(.system(size: 36, weight: .bold))
                            .foregroundStyle(.white)
                            .multilineTextAlignment(.center)
                        
                        Text(LocalizedStringKey("welcome_subtitle"))
                            .font(.system(size: 16))
                            .foregroundStyle(.gray)
                            .multilineTextAlignment(.center)
                    }
                    .padding(.top, 40)
                    
                    // Feature List Display
                    VStack(spacing: 16) {
                        BenefitRow(icon: "bolt.fill", titleKey: "instant_logging")
                        BenefitRow(icon: "wifi.slash", titleKey: "works_offline")
                        BenefitRow(icon: "chart.line.uptrend.xyaxis", titleKey: "smart_analytics")
                        BenefitRow(icon: "lock.fill", titleKey: "private_secure")
                        BenefitRow(icon: "doc.text.fill", titleKey: "notion_sync")
                    }
                }
                .padding(.horizontal, 24)
            }
            
            // Pinned Action Button
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

struct BenefitRow: View {
    let icon: String
    let titleKey: String
    
    var body: some View {
        HStack(spacing: 18) {
            ZStack {
                RoundedRectangle(cornerRadius: 14)
                    .fill(Color.white.opacity(0.06))
                    .frame(width: 46, height: 46)
                
                Image(systemName: icon)
                    .font(.title3)
                    .foregroundStyle(.yellow)
            }
            
            Text(LocalizedStringKey(titleKey))
                .font(.system(size: 18, weight: .medium))
                .foregroundStyle(.white)
            
            Spacer()
        }
        .padding()
        .background(Color.white.opacity(0.04))
        .clipShape(RoundedRectangle(cornerRadius: 22))
    }
}
