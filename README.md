# Memorize
此分支是添加了个人界面的代码。

### 1. 新增 Model

在 `Model` 中新增一个数据结构，用于存储“About Me”界面的个人信息。假设文件为 `ProfileModel.swift`：

```swift
import Foundation

struct Profile {
    var name: String
    var aboutText: String
    var photo: String    // 图片文件名
    var video: String    // 视频文件名
}
```

### 2. 新增 ViewModel

创建 `ProfileViewModel` 类，用于管理 `Profile` 模型的数据逻辑和状态管理。该文件为 `ProfileViewModel.swift`：

```swift
import Foundation

class ProfileViewModel: ObservableObject {
    // 初始化个人资料
    @Published private var profile = Profile(name: "孙少杰", 
                                             aboutText: "大家好啊，今天给大家来点想看的东西。",
                                             photo: "photo.png",
                                             video: "video.mp4")

    // MARK: - Access to the Model
    var name: String {
        profile.name
    }

    var aboutText: String {
        profile.aboutText
    }

    var photo: String {
        profile.photo
    }

    var video: String {
        profile.video
    }
}
```

### 3. 新增 View

在 `AboutMeView.swift` 文件中创建 `AboutMeView`，用于显示用户的个人信息，包括姓名、个人介绍文字、照片和视频。

```swift
import SwiftUI
import AVKit

struct AboutMeView: View {
    @ObservedObject var viewModel: ProfileViewModel
    
    var body: some View {
        VStack(spacing: 20) {
            // 姓名
            Text(viewModel.name)
                .font(.largeTitle)
                .bold()
                .padding()

            // 个人介绍
            Text(viewModel.aboutText)
                .font(.body)
                .multilineTextAlignment(.center)
                .padding()

            // 显示照片
            if let image = UIImage(named: viewModel.photo) {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.gray, lineWidth: 4))
                    .shadow(radius: 10)
                    .padding()
            }

            // 视频播放器
            if let videoURL = Bundle.main.url(forResource: viewModel.video, withExtension: "mp4") {
                VideoPlayer(player: AVPlayer(url: videoURL))
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 300)
                    .cornerRadius(12)
                    .shadow(radius: 8)
                    .padding()
            }

            Spacer()
        }
        .padding()
    }
}
```

### 4. 更新主视图或应用入口

在 `MemoriesApp.swift` 中，添加 `AboutMeView`，并初始化 `ProfileViewModel`，使其成为应用程序的一个入口页面。

```swift
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
```

### 完成后的 About Me 界面

这样设置后，`AboutMeView` 将显示姓名、个人介绍、一张图片和一个视频播放器。视频播放器会根据传入的视频文件进行播放，图片和个人介绍文字也可以随时通过更新 `ProfileViewModel` 的内容来进行动态更改。

#### MVVM 模式：

- **Model**: 使用 `Profile` 结构体存储个人信息（姓名、介绍、图片、视频文件名）。
- **ViewModel**: 在 `ProfileViewModel` 中管理数据的逻辑，将 `Profile` 数据传递给 `AboutMeView`。
- **View**: `AboutMeView` 负责显示用户界面，包括姓名、个人介绍、图片和视频播放器。
