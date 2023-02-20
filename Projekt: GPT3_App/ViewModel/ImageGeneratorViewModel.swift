//
//  Abschlussprojekt__SwiftUI_SynthaxApp.swift
//  Abschlussprojekt_ SwiftUI_Synthax
//
//  Created by WorkingAccount on 19.02.23.
//

import Foundation
@MainActor
class ImageGeneratorViewModel: ObservableObject {
    @Published var images: [AIImage] = []
    @Published var isLoading = false
    private let networkManager = OpenAINetworkManager.shared
    
    func getImagesFrom(_ prompt: String, imageSize: ImageSize) {
        isLoading = true
        Task {
            let images = try? await networkManager.generateImage(from: prompt, imageSize: imageSize)
            self.images = images ?? []
            isLoading = false
        }
    }
}
