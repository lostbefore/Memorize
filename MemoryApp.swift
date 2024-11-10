import SwiftUI

@main
struct MemoriesApp: App {
    var body: some Scene {
        WindowGroup {
            // 在这里可以选择显示主页面 MemoryGameView 或 AboutMeView
            let profileViewModel = ProfileViewModel()    // 创建 About Me 的 ViewModel
            AboutMeView(viewModel: profileViewModel)      // 显示 AboutMeView
        }
    }
}
