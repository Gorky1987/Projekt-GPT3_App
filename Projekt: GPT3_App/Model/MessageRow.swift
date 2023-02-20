//
//  Abschlussprojekt__SwiftUI_SynthaxApp.swift
//  Abschlussprojekt_ SwiftUI_Synthax
//
//  Created by WorkingAccount on 19.02.23.
//

import Foundation

struct MessageRow: Identifiable {
    
    let id = UUID()
    var isInteractingWithChatGPT: Bool
    
    let sendImage: String
    let sendText: String
    
    var responseImage: String
    var responseText: String
    
    var responseError: String?
}
