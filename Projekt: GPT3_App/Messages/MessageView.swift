//
//  Abschlussprojekt__SwiftUI_SynthaxApp.swift
//  Abschlussprojekt_ SwiftUI_Synthax
//
//  Created by WorkingAccount on 19.02.23.
//

import SwiftUI

struct MessageView: View {
    var message: String
    var isUserMessage: Bool
    var isBotMessage: Bool
    
    var body: some View {
        HStack(spacing: 0) {
            if isUserMessage {
                Spacer()
            }
            VStack(alignment: .leading,spacing: 0){
                if isBotMessage{
                    Text("OpenAI Bot")
                        .font(.footnote)
                        .foregroundColor(.black.opacity(0.5))
                        .padding(.leading, 10)
                }
                
                Text(message)
                    .padding(10)
                    .font(.callout)
                    .foregroundColor(isUserMessage ? .white : .black)
                    .background(isUserMessage ? Color.green : Color.gray.opacity(0.25))
                    .cornerRadius(25)
            }
            
            if !isUserMessage {
                Spacer()
            }
            
        }
        .padding(.leading, 10)
        .padding(.trailing, 10)
    }
}
