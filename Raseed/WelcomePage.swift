//
//  WelcomePage.swift
//  Raseed
//
//  Created by Hardik Bhardwaj on 23/05/26.
//

import SwiftUI

struct WelcomePage: View {
    
    @Binding var currentPage: Int
    
    var body: some View {
        
        VStack(spacing: 40) {
            
            Spacer()
            
            // Standardized Raseed Icon to match authentic native iOS home screen icon curvature
            Image("Raseedicon")
                .resizable()
                .scaledToFill() // Ensures the image populates the squircle canvas fully
                .frame(width: 130, height: 130)
                .clipShape(RoundedRectangle(cornerRadius: 28, style: .continuous)) // Authentic iOS curvature for 130pt display size
                .shadow(color: .white.opacity(0.3), radius: 25, x: 0, y: 10)
            
            VStack(spacing: 14) {
                
                Text(LocalizedStringKey("welcome_title"))
                    .font(.system(size: 38, weight: .bold))
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
                Text(LocalizedStringKey("welcome_subtitle"))
                    .font(.system(size: 18))
                    .foregroundStyle(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
            }
            
            Spacer()
            
            Button {
                currentPage += 1
            } label: {
                
                Text(LocalizedStringKey("continue_button"))
                    .font(.headline)
                    .foregroundStyle(.black)
                    .frame(maxWidth: .infinity)
                    .frame(height: 58)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
            }
            .padding(.horizontal, 24)
            .padding(.bottom, 40)
        }
    }
}
