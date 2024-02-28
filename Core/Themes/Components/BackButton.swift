import SwiftUI

struct BackButton: View {
    let onTap : () -> Void

    var body: some View {
        Button(action: {
            onTap()
            MusicPlayer.shared.playSoundEffect(soundEffectFileName: "click", format: "wav", vol: 3)
        }, label: {
            Image("backButton")
                .resizable()
                .scaledToFit()
                .frame(height: UIScreen.main.bounds.height * 0.075)
                .padding([.leading, .top])
        })
        .buttonStyle(ScaleButtonStyle())
    }
}
