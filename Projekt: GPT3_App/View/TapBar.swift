//
//  Abschlussprojekt__SwiftUI_SynthaxApp.swift
//  Abschlussprojekt_ SwiftUI_Synthax
//
//  Created by WorkingAccount on 19.02.23.
//


import SwiftUI

struct TabBar: View {
    @Binding var selection: Int
    
    var body: some View {
        HStack {
            Button(action: {
                selection = 1
            }) {
                Image(systemName: "house")
                    .font(.system(size: 25))
                    .foregroundColor(selection == 1 ? .yellow : .white)
            }
            Spacer()
            Button(action: {
                selection = 2
            }) {
                Image(systemName: "brain.head.profile")
                    .font(.system(size: 25))
                    .foregroundColor(selection == 2 ? .yellow : .white)
            }
            Spacer()
            Button(action: {
                selection = 3
            }) {
                Image(systemName: "photo.artframe")
                    .font(.system(size: 25))
                    .foregroundColor(selection == 3 ? .yellow : .white)
            }
        }
        .frame(height: 38)
        .padding(.horizontal)

        .background(
            Color.black.opacity(0.5)
                .blur(radius: 20)
        )
        .cornerRadius(8)
        .padding(.horizontal, 10)
    }
    
}


