//
//  NameInputPage.swift
//  Raseed
//

import SwiftUI

struct NameInputPage: View {
    
    @Binding var currentPage: Int
    
    @AppStorage("username")
    private var username = ""
    
    @FocusState private var isFocused: Bool
    
    var body: some View {
        
        VStack(spacing: 32) {
            
            Spacer()
            
            VStack(spacing: 14) {
                
                Text(LocalizedStringKey("what_should_we_call_you"))
                    .font(.system(size: 34, weight: .bold))
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.center)
                
                Text(LocalizedStringKey("personalize_experience"))
                    .foregroundStyle(.gray)
                    .multilineTextAlignment(.center)
            }
            
            VStack(spacing: 12) {
                
                TextField(
                    LocalizedStringKey("enter_category_name"),
                    text: $username
                )
                .focused($isFocused)
                .padding()
                .background(Color.white.opacity(0.06))
                .clipShape(RoundedRectangle(cornerRadius: 22))
                .foregroundStyle(.white)
                .submitLabel(.done)
                .onSubmit {
                    if !username.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                        isFocused = false
                        currentPage += 1
                    }
                }
            }
            .padding(.horizontal, 24)
            
            Spacer()
            
            Button {
                isFocused = false // Dismiss keyboard on button tap
                currentPage += 1
            } label: {
                
                Text(LocalizedStringKey("continue_button"))
                    .font(.headline)
                    .foregroundStyle(.black)
                    .frame(maxWidth: .infinity)
                    .frame(height: 58)
                    .background(
                        username.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
                        ? Color.gray
                        : Color.white
                    )
                    .clipShape(RoundedRectangle(cornerRadius: 20))
            }
            .disabled(username.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
            .padding(.horizontal, 24)
            .padding(.bottom, 40)
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                isFocused = true
            }
        }
        .onDisappear {
            isFocused = false // Resigns keyboard focus when the user swipes away
        }
    }
}
