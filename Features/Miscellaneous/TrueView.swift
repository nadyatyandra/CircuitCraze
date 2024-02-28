import SwiftUI

struct TrueView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Colors.purpleBg
                    .ignoresSafeArea()
                VStack {
                    Spacer()
                    Text("Progressing, but it's much more complicated than this")
                        .font(Font(CustomFont.shared.nunitoFontURL(size: 25.0)))
                        .foregroundColor(Colors.purpleText)
                        .fixedSize(horizontal: false, vertical: true)
                    Image("trueAnswer")
                        .resizable()
                        .cornerRadius(25.0)
                        .shadow(radius: 10)
                        .aspectRatio(contentMode: .fit)
                        .frame(height: UIScreen.main.bounds.height * 0.45)
                    Spacer()
                    NavigationLink(destination: HomeView()) {
                        Image("homeButton")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: UIScreen.main.bounds.height * 0.075)
                    }.simultaneousGesture(TapGesture().onEnded {
                        MusicPlayer.shared.playSoundEffect(soundEffectFileName: "click", format: "wav", vol: 3)
                    })
                    .buttonStyle(ScaleButtonStyle())
                }
                .padding()
            }
        }
        .navigationViewStyle(.stack)
        .navigationBarBackButtonHidden(true)
        .onAppear {
            MusicPlayer.shared.stopBackgroundMusic()
        }
    }
}

#Preview {
    TrueView()
}
