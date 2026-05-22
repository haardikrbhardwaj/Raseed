//
//  NotionConnectView.swift
//  Raseed
//
//  Created by Hardik Bhardwaj on 22/05/26.
//


import SwiftUI

struct NotionConnectView: View {

    var body: some View {

        VStack(spacing: 24) {

            Spacer()

            Image(systemName: "doc.text.fill")
                .font(.system(size: 80))
                .foregroundColor(.white)

            Text("Connect Notion")
                .font(.largeTitle.bold())
                .foregroundColor(.white)

            Text("Automatically sync your expenses")
                .foregroundColor(.gray)

            Button {

                UIApplication.shared.open(
                    NotionOAuthService.shared.loginURL()
                )

            } label: {

                Text("Continue with Notion")
                    .foregroundColor(.black)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.yellow)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
            }

            Spacer()
        }
        .padding()
        .background(Color.black)
    }
}