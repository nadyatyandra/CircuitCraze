import SwiftUI

struct StorylineView: View {
    var textArray = ["Meet El, an office worker who has just come home after a tiring day", "El would like to take a rest, so he turns on the television", "But... something happens...", "There is an electrical short circuit"]
    
    @State private var selectedImageIndex: Int = 0
    
    var body: some View {
        NavigationView {
            ZStack {
                Colors.purpleBg
                    .ignoresSafeArea()
                VStack {
                    Spacer()
                    TabView(selection: $selectedImageIndex) {
                        ForEach(0..<textArray.count, id: \.self) { index in
                            VStack {
                                Text("\(textArray[index])")
                                    .foregroundColor(Colors.purpleText)
                                    .font(Font(CustomFont.shared.nunitoFontURL(size: 25.0)))
                                    .fixedSize(horizontal: false, vertical: true)
                                Image("storyline-0\(index + 1)")
                                    .resizable()
                                    .tag(index)
                                    .cornerRadius(25.0)
                                    .shadow(radius: 10)
                                    .aspectRatio(contentMode: .fit)
                                    .frame(height: UIScreen.main.bounds.height * 0.45)
                            }
                        }
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                    .offset(y: selectedImageIndex == textArray.count - 1 ? UIScreen.main.bounds.height * 0.045 : 0)
                    HStack {
                        ForEach(0..<textArray.count, id: \.self) { index in
                            Circle()
                                .fill(Colors.purpleText.opacity(selectedImageIndex == index ? 1 : 0.33))
                                .frame(width: 35, height: 8)
                        }
                    }
                    .offset(y: selectedImageIndex == textArray.count - 1 ? -UIScreen.main.bounds.height * 0.0625 : -UIScreen.main.bounds.height * 0.15)
                    Spacer()
                    HStack {
                        Spacer()
                        if selectedImageIndex == textArray.count - 1 {
                            NavigationLink(destination: HomeView()) {
                                Image("helpElButton")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(height: UIScreen.main.bounds.height * 0.075)
                                    .padding(.trailing)
                            }.simultaneousGesture(TapGesture().onEnded {
                                MusicPlayer.shared.playSoundEffect(soundEffectFileName: "click", format: "wav", vol: 3)
                            })
                            .buttonStyle(ScaleButtonStyle())
                            .padding([.trailing, .bottom])
                        }
                    }
                }
            }
        }
        .navigationViewStyle(.stack)
        .navigationBarBackButtonHidden(true)
        .onAppear {
            MusicPlayer.shared.playBackgroundMusic(backgroundMusicFileName: "firstBGM", format: "mp3", vol: 2)
        }
    }
}

#Preview {
    StorylineView()
}
