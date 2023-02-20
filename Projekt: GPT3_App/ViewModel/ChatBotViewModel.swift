//
//  Abschlussprojekt__SwiftUI_SynthaxApp.swift
//  Abschlussprojekt_ SwiftUI_Synthax
//
//  Created by WorkingAccount on 19.02.23.
//


import Foundation
import OpenAISwift

class ChatBotViewModel: ObservableObject {
    
    @Published var isWaitingForResponse: Bool = false
    private let apiKey: String
    private let client: OpenAISwift

    init() {
        guard let filePath = Bundle.main.path(forResource: "Api-keys", ofType: "plist"),
              let plist = NSDictionary(contentsOfFile: filePath),
              let apiKey = plist["OpenAIKey"] as? String else {
            fatalError("Couldn't find api key in Api-keys.plist")
        }
        self.apiKey = apiKey
        self.client = OpenAISwift(authToken: apiKey)
    }

    func send(text: String, completion: @escaping (String) -> Void) {
        self.isWaitingForResponse = true

        self.client.sendCompletion(with: text, maxTokens: 500) { [weak self] result in
            guard let self = self else { return }

            switch result {
            case .success(let model):
                let output = model.choices.first?.text ?? ""
                completion(output)
                self.isWaitingForResponse = false
            case .failure(let error):
                print(error.localizedDescription)
                self.isWaitingForResponse = false
            }
        }
    }
}
