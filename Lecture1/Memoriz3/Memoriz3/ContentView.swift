//
//  ContentView.swift
//  Memoriz3
//
//  Created by Favour on 10/9/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack(content: {
            CardView(isFaceUp: true)
            CardView()
            CardView()
            CardView()
        })
        .foregroundColor(.orange)
        .padding()
    }
}

struct CardView: View {
   @State var isFaceUp = false
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            if isFaceUp {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text("🍆")
                    .font(.largeTitle)
            } else {
                base
            }
           
        }.onTapGesture {
            isFaceUp.toggle()
        }
    }
}






























#Preview {
    ContentView()
}
