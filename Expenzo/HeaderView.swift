//
//  HeaderView.swift
//  Raseed
//
//  Created by Hardik Bhardwaj on 22/05/26.
//

import SwiftUI

struct HeaderView: View {

    @AppStorage("username")
    private var username = "User"

    var body: some View {

        HStack {

            VStack(alignment: .leading, spacing: 6) {

                Text("welcome_back")
                    .foregroundColor(.gray)

                Text(username.isEmpty ? "User" : username)
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)
            }

            Spacer()

//            Image(systemName: "bell.fill")
//                .foregroundColor(.white)
//                .font(.title3)
        }
    }
}
