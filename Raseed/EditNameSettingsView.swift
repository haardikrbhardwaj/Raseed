import SwiftUI

struct EditNameView: View {
    @Environment(\.dismiss) private var dismiss
    @Binding var name: String
    @State private var inputName: String = ""
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 24) {
                Text("edit_name")
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("your_name")
                        .font(.caption)
                        .foregroundColor(.gray)
                    
                    TextField("", text: $inputName)
                        .foregroundColor(.white)
                        .padding()
                        .background(AppColors.card)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(Color.white.opacity(0.1), lineWidth: 1)
                        )
                }
                
                Spacer()
                
                Button {
                    name = inputName
                    dismiss()
                } label: {
                    Text("save_changes")
                        .font(.headline)
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                }
                .disabled(inputName.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
                .opacity(inputName.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ? 0.6 : 1.0)
            }
            .padding()
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    dismiss()
                } label: {
                    HStack(spacing: 4) {
                        Image(systemName: "chevron.left")
                    
                    }
                    .foregroundColor(.gray)
                }
            }
        }
        .onAppear {
            inputName = name
        }
    }
}
