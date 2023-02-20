//
//  Abschlussprojekt__SwiftUI_SynthaxApp.swift
//  Abschlussprojekt_ SwiftUI_Synthax
//
//  Created by WorkingAccount on 19.02.23.
//
import SwiftUI

struct MessageImageView: View {
    
    var image: String
    
    var body: some View {
        if image.hasPrefix("http"), let url = URL(string: image) {
            AsyncImage(url: url) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30, alignment: .center)
                    .clipShape(
                        Circle()
                    )
            } placeholder: {
                ProgressView()
            }
        } else {
            Image(image)
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30, alignment: .center)
                .clipShape(
                    Circle()
                )
        }
    }
}


