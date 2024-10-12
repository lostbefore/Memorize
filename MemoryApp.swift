import SwiftUI

@main
struct MemoryApp: App {
    var body: some Scene {
        WindowGroup {
            let game = MemoryGameViewModel()
            MemoryGameView(viewModel: game)
        }
    }
}

