import SwiftUI
import AVKit

struct VideoPlayerView: UIViewControllerRepresentable {
    let videoFileName: String
    
    func makeUIViewController(context: Context) -> AVPlayerViewController {
        let player = AVPlayer(url: Bundle.main.url(forResource: videoFileName, withExtension: "mp4")!)
        let playerViewController = AVPlayerViewController()
        playerViewController.player = player
        return playerViewController
    }

    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {
      
    }
}
