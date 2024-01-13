//
//  ContentView.swift
//  memorized
//
//  Created by Lucas Vinicius Ramos Souza on 12/01/24.
//

import SwiftUI

struct ContentView: View {
    let emojis = ["👻", "🎃", "💀", "👹", "👻", "🎃", "💀", "👹", "👹", "👻", "🎃", "💀", "👹"  ]
    
    @State var cardCount: Int = 3
    
    var body: some View {
        VStack {
            ScrollView {
                cards
            }
            Spacer()
            cardCountAdjusters
        }
        .padding()
   
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
            ForEach(0..<cardCount, id: \.self) { index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(.orange)
    }
    
    var cardCountAdjusters: some View {
        HStack {
            cardRemover
            Spacer()
            cardAdder
        }
        .imageScale(.large)
        .font(.largeTitle)
    }
    
    func cardCountAdjuster(by offset: Int, symbol: String) -> some View {
        Button(action: {
                cardCount += offset
        }, label: {
            Image(systemName: symbol)
        })
        .disabled(cardCount  + offset < 1 || cardCount + offset > emojis.count)
    }
    
    var cardAdder: some View {
        cardCountAdjuster(by: +1, symbol: "rectangle.stack.badge.plus.fill" )
    }
    
    var cardRemover: some View {
        cardCountAdjuster(by: -1, symbol: "rectangle.stack.badge.minus.fill" )
    }
}

struct CardView: View {
    var content: String
    @State var isFaceUp: Bool = true
    
    var body: some View {
        ZStack() {
            let baseContent:RoundedRectangle = RoundedRectangle(cornerRadius: 12)
            
            Group {
                baseContent.fill(.white)
                baseContent.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)
            baseContent.fill().opacity(isFaceUp ? 0 : 1)
        }
        .onTapGesture() {
            isFaceUp.toggle()
        }
    }
}

#Preview {
    ContentView()
}
