//
//  ContentView.swift
//  SwiftUi-Camp
//
//  Created by 3rabApp-oday on 04/07/2023.
//

import SwiftUI

extension Image {
    
    //MARK: - extension on image to set some modifiers .. to make code is global
    func imageModifiers() -> some View {
        self
            .resizable()
            .scaledToFit()
    }
    
    //MARK: -  use previous modifiers and plus on it some other
    func iconModifier() -> some View {
        self
            .imageModifiers()
            .frame(maxWidth: 180)
            .foregroundColor(.purple)
            .opacity(0.5)
    }
}

struct ContentView: View {
        
        private let imageUrlL:String = "https://credo.academy/credo-academy@3x.png"
        var body: some View {
            
            
            VStack {
                
                // get image from server and build animation with type spring
                AsyncImage(url: URL(string: imageUrlL),transaction: Transaction(animation: .spring(response: 0.8, dampingFraction: 0.4, blendDuration: 0.0))) { phase in
                    
                    // switch on response what i get from server
                    
                    switch phase {
                        
                    case .success(let image):
                        image.imageModifiers() // ad modifiers
                            .transition(.scale) // set presentation type of image (animation)
                    case.failure:
                        Image(systemName: "ant.circle.fill").iconModifier() // placholder when fail
                    case .empty:
                        Image(systemName: "photo.circle.fill").iconModifier() // placholder when empty
                    @unknown default:
                        ProgressView()
                    }
                    
                }
                    
                Text("IOS".uppercased())
                
                    //.kerning(10) // it mean the space between every char
                
                    //.underline(true, color: .red)
                
                    //.strikethrough(true,color: .red)
                
                   // .foregroundColor(.blue)
                   // .foregroundStyle(.blue.gradient)
                
                   // .fontWeight(.semibold)
                
                    .font(.system(size: 180, weight: .black, design: .default))
                
                    .foregroundStyle(LinearGradient(colors: [.pink,.purple , .blue],
                                                    startPoint: .topLeading,
                                                    endPoint: .bottomTrailing)) // this is for make gradinet color to text
                    
                
                   // .baselineOffset(10) // the space between every line in text
                
                   // .frame(width: 100, height: 100, alignment: .center) // set width and height to text his alignment
                
                   // .minimumScaleFactor(0.1) // this mean minimize font size to be fit on his frame
                
                    // .multilineTextAlignment(.center) // the alignment when he text have multi line
                
                Spacer()
            }
            

        }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
