//
//  Abschlussprojekt__SwiftUI_SynthaxApp.swift
//  Abschlussprojekt_ SwiftUI_Synthax
//
//  Created by WorkingAccount on 19.02.23.
//

import SwiftUI

struct ChatView: View {
    
    @ObservedObject var chatGPTViewModel = ChatGPTViewModel(api: ChatGPTAPI(apiKey: APIKey))
    @State var typingMessage: String = ""
    @State var models = [String]()
    @Namespace var bottomID
    static let APIKey = "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"
    
    @FocusState var isTextFieldFocused: Bool
    
    let hapticImpact = UIImpactFeedbackGenerator(style: .medium)
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack {  Image("Background")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
                
                
                NavigationView {
                    VStack(alignment: .leading) {
                        ScrollViewReader { reader in
                            ScrollView(.vertical) {
                                ForEach(models, id: \.self) { message in
                                    HStack {
                                        if message.contains("Me: ") {
                                            MessageView(message: message.replacingOccurrences(of: "Me: ", with: ""), isUserMessage: true, isBotMessage: false)
                                        } else if message.contains("ChatBot: ") {
                                            MessageView(message: message.replacingOccurrences(of: "ChatBot: ", with: "").trimmingCharacters(in: .whitespacesAndNewlines), isUserMessage: false, isBotMessage: true)
                                        } else {
                                            MessageIndicatorView()
                                            Spacer()
                                        }
                                    }
                                    .padding(.horizontal, 0)
                                    .ignoresSafeArea()
                                }
                                Text("").id(bottomID)
                            }
                            .onAppear {
                                withAnimation {
                                    reader.scrollTo(bottomID)
                                }
                            }
                            .onChange(of: models.count) { _ in
                                withAnimation {
                                    reader.scrollTo(bottomID)
                                }
                            }
                        }
                        
                        
                        HStack(alignment: .center) {
                            
                            TextField("Message...", text: $typingMessage)
                                .accentColor(.green)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding(.horizontal, 10)
                                .padding(.vertical, 10)
                                .cornerRadius(20)
                                .focused($isTextFieldFocused)
                            
                            Button {
                                Task { @MainActor in
                                    isTextFieldFocused = false
                                    await chatGPTViewModel.sendTapped()
                                    hapticImpact.impactOccurred()
                                }
                                self.typingMessage = ""
                            } label: {
                                Image(systemName: "paperplane.fill")
                                    .foregroundColor(.white)
                                    .padding(10)
                                    .background(Color.green)
                                    .clipShape(Rectangle())
                                    .cornerRadius(8)
                            }
                        }.disabled(chatGPTViewModel.isInteractingWithChatGPT)
                            .padding()
                    }
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationBarTitle("ChatBot")
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Picker("Pick a language", selection: $chatGPTViewModel.selectedLanguage) {
                                ForEach(LanguageType.allCases, id: \.self) { item in
                                    Text(item.rawValue.capitalized)
                                }
                            }
                            .pickerStyle(MenuPickerStyle())
                        }
                    }
                }
            }
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}

