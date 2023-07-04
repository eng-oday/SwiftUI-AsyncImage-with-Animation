//
//  TextBootCamp.swift
//  SwiftUi-Camp
//
//  Created by 3rabApp-oday on 04/07/2023.
//

import SwiftUI



struct TextBootCamp: View {
    
    private let imageUrlL:String = "https://credo.academy/credo-academy@3x.png"
    var body: some View {
        
        
        VStack {
            
            AsyncImage(url: URL(string: imageUrlL)) { phase in
                
                switch phase {
                case .success(let image):
                    image.imageModifiers()
                        .transition(.scale)
                case.failure:
                    Image(systemName: "ant.circle.fill").iconModifier()
                case .empty:
                    Image(systemName: "photo.circle.fill").iconModifier()
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

struct TextBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        TextBootCamp()
    }
}
