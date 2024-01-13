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
    var isFaceUp: Bool = false
    
    var body: some View {
        ZStack {
            if isFaceUp {
                RoundedRectangle(
                    cornerSize: CGSize(width: 20, height: 10))
                .strokeBorder(lineWidth: 10)
                Text("👻").font(.largeTitle)
            } else {
                RoundedRectangle(
                    cornerSize: CGSize(width: 20, height: 10))
            }
            
           
        }
    }
}

#Preview {
    ContentView()
}
