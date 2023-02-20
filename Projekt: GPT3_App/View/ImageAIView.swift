//
//  Abschlussprojekt__SwiftUI_SynthaxApp.swift
//  Abschlussprojekt_ SwiftUI_Synthax
//
//  Created by WorkingAccount on 19.02.23.
//

import SwiftUI

struct ImageAIView: View {
    @StateObject var imageViewModel = ImageGeneratorViewModel()
    @State var textPrompt = ""
    var body: some View {
        ZStack {
            Image("Background")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                ZStack(alignment: .center) {
                    Color.gray.blendMode(.overlay)
                    if imageViewModel.isLoading {
                        ProgressView()
                    }
                }
                .overlay {
                    if !imageViewModel.images.isEmpty {
                        ForEach(imageViewModel.images) { aiimage in
                            AsyncImage(url: aiimage.imageURL) { image in
                                ZStack {
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                    VStack {
                                        Spacer()
                                        HStack {
                                            Spacer()
                                            Text(aiimage.prompt)
                                                .font(.headline)
                                                .minimumScaleFactor(0.4)
                                                .lineLimit(3)
                                            Spacer()
                                        }
                                        .padding()
                                        .background(.thinMaterial)
                                    }
                                }
                            } placeholder: {
                                ZStack {
                                    Color.gray.blendMode(.overlay)
                                    ProgressView()
                                }
                            }
                            .clipped()
                        }
                    }
                }
                .overlay {
                    if imageViewModel.isLoading {
                        ProgressView()
                    }
                }
                .frame(height: 500)
                .edgesIgnoringSafeArea(.top)
                Spacer()
                HStack {
                    TextField("Prompt", text: $textPrompt, prompt: Text("Imagine ..."))
                        .accentColor(.green)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal, 10)
                        .padding(.vertical, 10)
                        .cornerRadius(20)
                    Button(action: {
                        imageViewModel.getImagesFrom(textPrompt, imageSize: .medium)
                    }) {
                        Image(systemName: "paperplane.fill")
                            .foregroundColor(.white)
                            .padding(10)
                            .background(Color.green)
                            .clipShape(Rectangle())
                            .cornerRadius(8)
                            
                    }
                }   .padding(.horizontal, 10)
                    .padding(.bottom, 10)
         }
            
        }
               }
           }


struct ImageAIView_Previews: PreviewProvider {
    static var previews: some View {
        ImageAIView()
    }
}
