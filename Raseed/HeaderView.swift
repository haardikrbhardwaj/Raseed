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

                // SwiftUI automatically treats this literal string as a LocalizedStringKey
                Text("welcome_back")
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
