//
//  ContentView.swift
//  memorized
//
//  Created by Lucas Vinicius Ramos Souza on 12/01/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            CardView(isFaceUp: true)
            CardView()
            CardView()
            CardView()
        }
        .padding()
        .foregroundColor(.orange)
    }
}

struct CardView: View {
   @State var isFaceUp: Bool = false
    
    var body: some View {
        ZStack() {
            let baseContent:RoundedRectangle = RoundedRectangle(cornerRadius: 12)
            
            if isFaceUp {
                baseContent.fill(.white)
                baseContent.strokeBorder(lineWidth: 2)
                Text("👻").font(.largeTitle)
            } else {
                baseContent.fill()
            }
        }
        .onTapGesture() {
            isFaceUp.toggle()
        }
    }
}

#Preview {
    ContentView()
}
