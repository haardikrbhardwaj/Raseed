//
//  HeaderView.swift
//  Raseed
//
//  Created by Hardik Bhardwaj on 22/05/26.
//


import SwiftUI

struct HeaderView: View {

    var body: some View {

        HStack {

            VStack(alignment: .leading, spacing: 6) {

                Text("Welcome Back")
                    .foregroundColor(.gray)

                Text("Hardik")
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)
            }

            Spacer()

            Image(systemName: "bell.fill")
                .foregroundColor(.white)
                .font(.title3)
        }
    }
}