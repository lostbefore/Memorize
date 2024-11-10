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
