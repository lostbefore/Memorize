import SwiftUI

struct CardView: View {
    var card: MemoryGame<String>.Card  // 从 ViewModel 传递进来的卡片数据

    var body: some View {
        ZStack {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.white)
                RoundedRectangle(cornerRadius: 10)
                    .stroke(lineWidth: 3)
                Text(card.content)
                    .font(.largeTitle)
            } else {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.orange)
            }
        }
        .aspectRatio(2/3, contentMode: .fit)
    }
}

