import SwiftUI

struct SeriesSecondView: View {
    @Environment(\.dismiss) private var dismiss
    
    @State var lamp1 = false
    @State var lamp2 = false
    @State var lamp3 = false
    @State var lamp4 = false
    @State var shake = false
    @State var showModal = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("background")
                    .resizable()
                    .frame(height: UIScreen.main.bounds.height * 1.005)
                VStack {
                    HStack {
                        BackButton { dismiss() }
                        Spacer()
                    }
                    Spacer()
                    Group {
                        Image("seriesQuestion")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: UIScreen.main.bounds.width * 0.8)
                        Spacer()
                        ZStack {
                            Image("menuButton")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: UIScreen.main.bounds.width * 0.9)
                            HStack {
                                BulbSelection(isSelected: false, value: "1") {
                                    lamp1.toggle()
                                    MusicPlayer.shared.playSoundEffect(soundEffectFileName: "click", format: "wav", vol: 3)
                                }
                                BulbSelection(isSelected: false, value: "2") {
                                    lamp2.toggle()
                                    MusicPlayer.shared.playSoundEffect(soundEffectFileName: "click", format: "wav", vol: 3)
                                }
                                BulbSelection(isSelected: false, value: "4") {
                                    lamp3.toggle()
                                    MusicPlayer.shared.playSoundEffect(soundEffectFileName: "click", format: "wav", vol: 3)
                                }
                                BulbSelection(isSelected: false, value: "5") {
                                    lamp4.toggle()
                                    MusicPlayer.shared.playSoundEffect(soundEffectFileName: "click", format: "wav", vol: 3)
                                }
                            }
                        }
                        Spacer()
                    }
                    .shake($shake) {}
                    Button(action: {
                        if lamp1 == true && lamp2 == false && lamp3 == true && lamp4 == true {
                            MusicPlayer.shared.playSoundEffect(soundEffectFileName: "correct", format: "wav", vol: 1)
                            withAnimation(.easeIn(duration: 0.5)) {
                                showModal = true
                            }
                        }
                        else {
                            shake = true
                            MusicPlayer.shared.playSoundEffect(soundEffectFileName: "wrong", format: "wav", vol: 1)
                        }
                    }, label: {
                        Image("checkButton")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: UIScreen.main.bounds.height * 0.075)
                            .padding(.bottom)
                    })
                    .buttonStyle(ScaleButtonStyle())
                }
                .padding()
                
                if showModal == true {
                    TrueView()
                        .zIndex(10)
                        .transition(.move(edge: .top))
                }
            }
        }
        .navigationViewStyle(.stack)
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    SeriesSecondView()
}
