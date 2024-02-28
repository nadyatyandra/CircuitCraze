import SwiftUI

struct HomeView: View {
    @State private var path: [Int] = []
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("homeBackground")
                    .resizable()
                    .frame(height: UIScreen.main.bounds.height * 1.005)
                Color.black
                    .ignoresSafeArea()
                    .opacity(0.6)
                VStack {
                    Spacer()
                    Image("logo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: UIScreen.main.bounds.height * 0.3)
                    Spacer()
                    NavigationLink(destination: SeriesFirstView()) {
                        Image("seriesButton")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: UIScreen.main.bounds.height * 0.08)
                            .padding()
                    }.simultaneousGesture(TapGesture().onEnded {
                        MusicPlayer.shared.playSoundEffect(soundEffectFileName: "click", format: "wav", vol: 3)
                    })
                    .buttonStyle(ScaleButtonStyle())
                    NavigationLink(destination: ParallelFirstView()) {
                        Image("parallelButton")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: UIScreen.main.bounds.height * 0.08)
                            .padding()
                    }.simultaneousGesture(TapGesture().onEnded {
                        MusicPlayer.shared.playSoundEffect(soundEffectFileName: "click", format: "wav", vol: 3)
                    })
                    .buttonStyle(ScaleButtonStyle())
                    NavigationLink(destination: PracticeFirstView()) {
                        Image("practiceButton")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: UIScreen.main.bounds.height * 0.08)
                            .padding()
                    }.simultaneousGesture(TapGesture().onEnded {
                        MusicPlayer.shared.playSoundEffect(soundEffectFileName: "click", format: "wav", vol: 3)
                    })
                    .buttonStyle(ScaleButtonStyle())
                    NavigationLink(destination: TakeExamFirstView()) {
                        Image("takeExamButton")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: UIScreen.main.bounds.height * 0.08)
                            .padding()
                    }.simultaneousGesture(TapGesture().onEnded {
                        MusicPlayer.shared.playSoundEffect(soundEffectFileName: "click", format: "wav", vol: 3)
                    })
                    .buttonStyle(ScaleButtonStyle())
                    Spacer()
                    NavigationLink(destination: CreditView()) {
                        Image("creditsButton")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: UIScreen.main.bounds.height * 0.08)
                            .padding(.bottom)
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
            MusicPlayer.shared.playBackgroundMusic(backgroundMusicFileName: "secondBGM", format: "mp3", vol: 1)
        }
    }
}

#Preview {
    HomeView()
}
