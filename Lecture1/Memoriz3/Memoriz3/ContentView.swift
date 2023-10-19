//
//  ContentView.swift
//  Memoriz3
//
//  Created by Favour on 10/9/23.
//

import SwiftUI

struct ContentView: View {
    let emojis: [String] = ["🎃", "👻", "🕷", "🕸", "🦇", "🧛", "🧛‍♂️", "🧛‍♀️", "🧟", "🧟‍♂️", "🧟‍♀️" ]
    @State var cardCount: Int = 4
    var body: some View {
        VStack {
            ScrollView {
                cards
            }
            Spacer()
            cardCountAdjuster
        } .padding()
    }
    func cardCountAdjuster(by offset: Int, symbol: String) -> some View {
        Button(
            action: {
                cardCount += 1
            },
            label : {
                Image(systemName: symbol)
            }
        ).disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }
    var cardRemover: some View {
        cardCountAdjuster(by: -1 , symbol: "rectangle.stack.badge.minus.fill" )
    }
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum:120))]) {
            ForEach(0..<cardCount, id: \.self) { index in
                CardView(content: emojis[index]).aspectRatio(2/3, contentMode: .fit)
            }
        }.foregroundColor(.orange)
    }
    var cardCountAdjuster: some View {
        HStack {
            cardRemover
            Spacer()
            cardAdder
        }.imageScale(.large)
            .font(.largeTitle)
    }
    var cardAdder: some View {
        cardCountAdjuster(by: +1 , symbol: "rectangle.stack.badge.plus.fill" )
    }
}
    
struct CardView: View {
    let content: String
    @State var isFaceUp = true
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content)
                    .font(.largeTitle)
            }.opacity(isFaceUp  ? 1: 0)
            base.fill().opacity(isFaceUp  ? 0: 1)
            
        }.onTapGesture {
            isFaceUp.toggle()
        }
    }
}
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    #Preview {
        ContentView()
    }
    
