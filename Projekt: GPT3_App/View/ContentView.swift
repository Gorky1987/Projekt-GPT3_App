//
//  Abschlussprojekt__SwiftUI_SynthaxApp.swift
//  Abschlussprojekt_ SwiftUI_Synthax
//
//  Created by WorkingAccount on 19.02.23.
//

import Foundation
import SwiftUI

struct ContentView: View {
    
    var body: some View{
        VStack(spacing:0) {
            ZStack {
                Image("Background")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 0) {
                    NavigationView {
                        VStack(spacing: 20) {
                            VStack {
                                HStack {
                                    Text("MindMod")
                                        .font(.system(size: 32))
                                        .foregroundColor(.white)
                                        .fontWeight(.bold)
                                        .padding(.leading)
                                    Spacer()
                                    Image("logo")
                                        .resizable()
                                        .frame(width: 65, height: 65)
                                        .imageScale(.large)
                                        .padding(.trailing)
                                }
                                .padding()
                                .background(Color.gray.opacity(0.7))
                                .cornerRadius(10)
                                
                                
                                NavigationLink(destination: ChatView()) {
                                    HStack {
                                        Text("ChatGPT")
                                            .font(.title2)
                                            .bold()
                                            .foregroundColor(.green)
                                        Spacer()
                                        Image(systemName: "bubble.right.fill")
                                            .foregroundColor(.green)
                                            .font(.system(size: 25))
                                    }
                                        .background(Color.gray.opacity(0.7))
                                        .cornerRadius(10)
                                }
                                .padding
                                Divider()
                          
                                NavigationLink(destination: ImageAIView()) {
                                    HStack {
                                        Text("DrawAI")
                                            .font(.title2)
                                            .bold()
                                            .foregroundColor(.green)
                                        Spacer()
                                        Image(systemName: "pencil.and.outline")
                                            .foregroundColor(.green)
                                            .font(.system(size: 25))
                                    }.frame()
                                        .background(Color.gray.opacity(0.7))
                                        .cornerRadius(10)
                                }
                                .padding(.top, 10)
                                Divider()
                      
                             ScrollView(.horizontal) {
                                    LazyHStack(spacing: 10) {
                                        ForEach(savedImages, id: \.self) { imageName in
                                            Image(imageName)
                                                .resizable()
                                                .scaledToFit()
                                                .padding()
                                                .background(Color.gray.opacity(0.7))
                                                .cornerRadius(10)
                                        }
                                    }
                                }
                                  .padding()
                        
                            }
                        }
                    }.navigationBarHidden(true)
                }
            }
        }
    }
}
                
let savedImages = ["image1", "image2", "image3", "image4", "image5"]

                
                
                
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
