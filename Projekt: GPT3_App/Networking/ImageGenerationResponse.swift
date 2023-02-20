//
//  Abschlussprojekt__SwiftUI_SynthaxApp.swift
//  Abschlussprojekt_ SwiftUI_Synthax
//
//  Created by WorkingAccount on 19.02.23.
//

import Foundation

struct ImageGenerationResponse: Codable {
    struct ImageResponse: Codable {
        let url: URL
    }
    
    let created: Int
    let data: [ImageResponse]
}
