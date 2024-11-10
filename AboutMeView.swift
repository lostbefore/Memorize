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
