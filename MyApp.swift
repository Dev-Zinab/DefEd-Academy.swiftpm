import SwiftUI
import TipKit

@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            SplashScreenView()
                
}
    }

    
    
    init() {
        
    try? Tips.configure([
    .datastoreLocation(.applicationDefault),
    .displayFrequency(.immediate)

        ])
    }}


