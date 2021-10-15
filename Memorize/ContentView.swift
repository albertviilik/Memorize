//
//  ContentView.swift
//  Memorize
//
//  Created by Albert Viilik on 17/09/2021.
//

import SwiftUI

struct ContentView: View {
    // Add 24 things
    var emojis = ["🚗", "⛴", "✈️", "🚜", "🛴", "🚲", "🏍", "🛺", "🚠", "🚟", "🚄", "🚅", "🚈", "🚂", "🚇", "🚊", "🚉", "🚤", "🛬", "🚀", "🛸", "🚁", "🛶", "⛵️"]
    @State var emojiCount = 20
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                        CardView(content: emoji, faceUp: true)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            .padding(.horizontal)
            .foregroundColor(.red)
            Spacer()
            HStack {
                remove
                Spacer()
                add
            }
            .font(.largeTitle)
            .padding(.horizontal)
        }
    }
    
    var remove: some View {
        Button {
            if emojiCount > 1 {
                emojiCount -= 1
            }
        } label: {
            Image(systemName: "minus.circle")
        }
    }
    
    var add: some View {
        Button {
            if emojiCount < emojis.count {
                emojiCount += 1
            }
        } label: {
            Image(systemName: "plus.circle")
        }
    }
}

struct CardView: View {
    var content: String
    
    @State var faceUp: Bool
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if faceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content)
                    .font(.largeTitle)
            } else {
                shape.fill()
            }
        }.onTapGesture {
            self.faceUp = !self.faceUp
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
