//
//  Abschlussprojekt__SwiftUI_SynthaxApp.swift
//  Abschlussprojekt_ SwiftUI_Synthax
//
//  Created by WorkingAccount on 19.02.23.
//

import Foundation

struct Choice: Decodable {
    let text: String
}

struct CompletionResponse: Decodable {
    let choices: [Choice]
}
