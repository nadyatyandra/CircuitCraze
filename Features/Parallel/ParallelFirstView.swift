import SwiftUI

struct ParallelFirstView: View {
    @Environment(\.dismiss) private var dismiss
    
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
                    Image("parallelFirst1")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: UIScreen.main.bounds.width * 0.75)
                    Image("parallelFirst2")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: UIScreen.main.bounds.width * 0.8)
                    Spacer()
                    HStack {
                        Spacer()
                        NavigationLink(destination: ParallelSecondView()) {
                            Image("nextButton")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: UIScreen.main.bounds.height * 0.075)
                        }.simultaneousGesture(TapGesture().onEnded {
                            MusicPlayer.shared.playSoundEffect(soundEffectFileName: "click", format: "wav", vol: 3)
                        })
                        .buttonStyle(ScaleButtonStyle())
                        .padding([.trailing, .bottom])
                    }
                }
                .padding()
            }
        }
        .navigationViewStyle(.stack)
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    ParallelFirstView()
}
