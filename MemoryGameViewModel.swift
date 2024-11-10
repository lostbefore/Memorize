import SwiftUI

class MemoryGameViewModel: ObservableObject {
    @Published private var model: MemoryGame<String> = MemoryGameViewModel.createMemoryGame()

    static func createMemoryGame() -> MemoryGame<String> {
        let emojis = ["👻", "🎃", "🕷️", "🍭", "🍬", "🧛‍♂️", "🧙‍♀️", "🦇", "🍎", "👽", "🎈", "🌟", "🍀", "🔥", "🐍", "🍉"]
        return MemoryGame<String>(numberOfPairsOfCards: 8) { pairIndex in
            emojis[pairIndex]
        }
    }

    // MARK: - Access to the Model
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }

    // MARK: - Intent(s)
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}

