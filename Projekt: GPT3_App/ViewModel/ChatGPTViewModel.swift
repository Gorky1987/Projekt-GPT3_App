//
//  Abschlussprojekt__SwiftUI_SynthaxApp.swift
//  Abschlussprojekt_ SwiftUI_Synthax
//
//  Created by WorkingAccount on 19.02.23.
//


import Foundation
import OpenAISwift

 class ChatGPTViewModel: ObservableObject {
        
    @Published var isInteractingWithChatGPT = false
    @Published var messages: [MessageRow] = []
    @Published var typingMessage: String = ""
    @Published var selectedLanguage = LanguageType.english // 2


    private let chatGPTApi: ChatGPTAPI
    
    init(api: ChatGPTAPI) {
        self.chatGPTApi = api
    }
    
    @MainActor
    private func send(text: String) async {
        self.setChatLanguage()
        isInteractingWithChatGPT = true
        var streamText = ""
        var msgRow = MessageRow(isInteractingWithChatGPT: true,
                                sendImage: "profile",
                                sendText: text,
                                responseImage: "John Doe",
                                responseText: streamText,
                                responseError: nil)
        
        self.messages.append(msgRow)
        
        do {
            let stream = try await chatGPTApi.sendMessageStream(text: text)
            for try await text in stream {
                streamText += text
                msgRow.responseText = streamText.trimmingCharacters(in: .whitespacesAndNewlines)
                self.messages[self.messages.count - 1] = msgRow
            }
        } catch {
            msgRow.responseError = error.localizedDescription
        }
        
        msgRow.isInteractingWithChatGPT = false
        self.messages[self.messages.count - 1] = msgRow
        isInteractingWithChatGPT = false
    }
    
    func setChatLanguage() {
        self.chatGPTApi.setChatGPTLanguage(languageType: selectedLanguage)
    }
    
    @MainActor
    func sendTapped() async {
        let text = typingMessage
        typingMessage = ""
        await send(text: text)
    }
    
    @MainActor
    func retry(message: MessageRow) async {
        guard let index = messages.firstIndex(where: { $0.id == message.id }) else {
            return
        }
        
        self.messages.remove(at: index)
        await send(text: message.sendText)
    }
}
