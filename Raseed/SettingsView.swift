//
//import SwiftUI
//import SwiftData
//
//struct SettingsView: View {
//    @Environment(\.modelContext) private var modelContext
//    @State private var userName: String = "Hardik Bhardwaj"
//    
//    // Callback closure to trigger the root view state change
//    var onLogout: () -> Void
//    
//    var body: some View {
//        NavigationStack {
//            ZStack {
//                Color.black
//                    .ignoresSafeArea()
//                
//                ScrollView {
//                    VStack(alignment: .leading, spacing: 28) {
//                        
//                        // MARK: HEADER
//                        Text("settings")
//                            .font(.largeTitle.bold())
//                            .foregroundColor(.white)
//                        
//                        // MARK: PROFILE SECTION
//                        NavigationLink {
//                            EditNameView(name: $userName)
//                        } label: {
//                            HStack(spacing: 16) {
//                                Circle()
//                                    .fill(Color.white.opacity(0.1))
//                                    .frame(width: 60, height: 60)
//                                    .overlay(
//                                        Image(systemName: "person.fill")
//                                            .font(.title2)
//                                            .foregroundColor(.white)
//                                    )
//                                
//                                VStack(alignment: .leading, spacing: 4) {
//                                    Text(userName)
//                                        .font(.headline)
//                                        .foregroundColor(.white)
//                                    Text("edit_profile")
//                                        .font(.subheadline)
//                                        .foregroundColor(.gray)
//                                }
//                                
//                                Spacer()
//                                
//                                Image(systemName: "chevron.right")
//                                    .foregroundColor(.gray)
//                            }
//                            .padding()
//                            .background(AppColors.card)
//                            .clipShape(RoundedRectangle(cornerRadius: 20))
//                        }
//                        
//                        // MARK: SETTINGS LIST
//                        VStack(spacing: 16) {
//                            NavigationLink {
//                                BudgetSettingsView()
//                            } label: {
//                                settingsRow(title: "monthly_budget", icon: "target")
//                            }
//                            
//                            NavigationLink {
//                                LanguageSettingsView()
//                            } label: {
//                                settingsRow(title: "language", icon: "globe")
//                            }
//                            
//                            NavigationLink {
//                                Text("coming_soon")
//                                    .foregroundColor(.white)
//                                    .background(Color.black)
//                            } label: {
//                                settingsRow(title: "notion_sync", icon: "link")
//                            }
////                            
////                            NavigationLink {
////                                Text("coming_soon")
////                                    .foregroundColor(.white)
////                                    .background(Color.black)
////                            }
////                            label: {
////                                settingsRow(title: "ai_insights", icon: "sparkles")
////                            }
//                            
//                            NavigationLink {
//                                Text("coming_soon")
//                                    .foregroundColor(.white)
//                                    .background(Color.black)
//                            }
//                            label: {
//                                settingsRow(title: "notifications", icon: "bell")
//                            }
//                        }
//                        
//                        // MARK: ACCOUNT ACTIONS
//                        Button {
//                            handleLogout()
//                        } label: {
//                            HStack {
//                                Image(systemName: "arrow.left.square")
//                                Text("logout")
//                                Spacer()
//                            }
//                            .foregroundColor(.red)
//                            .padding()
//                            .background(AppColors.card)
//                            .clipShape(RoundedRectangle(cornerRadius: 20))
//                        }
//                        .padding(.top, 8)
//                    }
//                    .padding()
//                }
//            }
//            .navigationBarHidden(true)
//        }
//    }
//    
//    // MARK: SETTINGS ROW BUILDER
//    func settingsRow(title: String, icon: String) -> some View {
//        HStack {
//            Image(systemName: icon)
//                .foregroundColor(.white)
//            
//            Text(LocalizedStringKey(title))
//                .foregroundColor(.white)
//            
//            Spacer()
//            
//            Image(systemName: "chevron.right")
//                .foregroundColor(.gray)
//        }
//        .padding()
//        .background(AppColors.card)
//        .clipShape(RoundedRectangle(cornerRadius: 20))
//    }
//    
//    // MARK: LOGOUT LOGIC
//    private func handleLogout() {
//        clearLocalDatabase()
//        
//        // Execute the root view transition logic back to onboarding container layout
//        onLogout()
//    }
//    
//    // MARK: DATA MANAGEMENT CLEANDOWN
//    private func clearLocalDatabase() {
//        do {
//            // Clears any stored Expense nodes from SwiftData persistent layer
//            try modelContext.delete(model: Expense.self)
//            
//            // Clean down custom key allocations out of Standard local storage defaults
//            // UserDefaults.standard.removeObject(forKey: "custom_user_key_if_any")
//            
//            try modelContext.save()
//        } catch {
//            print("Failed to flush local storage contexts: \(error.localizedDescription)")
//        }
//    }
//}
//
//#Preview {
//    SettingsView(onLogout: {})
//        .modelContainer(for: Expense.self, inMemory: true)
//}
import SwiftUI
import SwiftData

struct SettingsView: View {
    @Environment(\.modelContext) private var modelContext
    @State private var userName: String = "Hardik Bhardwaj"
    
    var onLogout: () -> Void
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.black
                    .ignoresSafeArea()
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 28) {
                        
                        Text("settings")
                            .font(.largeTitle.bold())
                            .foregroundColor(.white)
                        
                        NavigationLink {
                            EditNameView(name: $userName)
                        } label: {
                            HStack(spacing: 16) {
                                Circle()
                                    .fill(Color.white.opacity(0.1))
                                    .frame(width: 60, height: 60)
                                    .overlay(
                                        Image(systemName: "person.fill")
                                            .font(.title2)
                                            .foregroundColor(.white)
                                    )
                                
                                VStack(alignment: .leading, spacing: 4) {
                                    Text(userName)
                                        .font(.headline)
                                        .foregroundColor(.white)
                                    Text("edit_profile")
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                }
                                
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.gray)
                            }
                            .padding()
                            .background(AppColors.card)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                        }
                        
                        VStack(spacing: 16) {
                            NavigationLink {
                                BudgetSettingsView()
                            } label: {
                                settingsRow(title: "monthly_budget", icon: "target")
                            }
                            
                            NavigationLink {
                                LanguageSettingsView()
                            } label: {
                                settingsRow(title: "language", icon: "globe")
                            }
                            
                            NavigationLink {
                                Text("coming_soon")
                                    .foregroundColor(.white)
                                    .background(Color.black)
                            } label: {
                                settingsRow(title: "notion_sync", icon: "link")
                            }
                            
                            Link(destination: URL(string: "https://yourwebsite.com/terms") ?? URL(string: "https://google.com")!) {
                                settingsRow(title: "terms_of_service", icon: "doc.text")
                            }
                            
                            Link(destination: URL(string: "https://yourwebsite.com/privacy") ?? URL(string: "https://google.com")!) {
                                settingsRow(title: "privacy_policy", icon: "shield")
                            }
                        }
                        
                        Button {
                            handleLogout()
                        } label: {
                            HStack {
                                Image(systemName: "arrow.left.square")
                                Text("logout")
                                Spacer()
                            }
                            .foregroundColor(.red)
                            .padding()
                            .background(AppColors.card)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                        }
                        .padding(.top, 8)
                    }
                    .padding()
                }
            }
            .navigationBarHidden(true)
        }
    }
    
    func settingsRow(title: String, icon: String) -> some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(.white)
            
            Text(LocalizedStringKey(title))
                .foregroundColor(.white)
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
        }
        .padding()
        .background(AppColors.card)
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
    
    private func handleLogout() {
        clearLocalDatabase()
        onLogout()
    }
    
    private func clearLocalDatabase() {
        do {
            try modelContext.delete(model: Expense.self)
            try modelContext.save()
        } catch {
            print("Failed to flush local storage contexts: \(error.localizedDescription)")
        }
    }
}

#Preview {
    SettingsView(onLogout: {})
        .modelContainer(for: Expense.self, inMemory: true)
}
