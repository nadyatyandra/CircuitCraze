import SwiftUI

struct CreditView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("background")
                    .resizable()
                    .frame(height: UIScreen.main.bounds.height * 1.005)
                Image("creditsPaper")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: UIScreen.main.bounds.height * 0.8)
                    .offset(y: UIScreen.main.bounds.height * 0.0375)
                VStack {
                    HStack {
                        BackButton { dismiss() }
                        Spacer()
                    }
                    Spacer()
                    Text("Credits")
                        .font(Font(CustomFont.shared.nunitoFontURL(size: 35.0)))
                        .foregroundColor(Colors.purpleText)
                    VStack(alignment: .leading) {
                        Text("Background musics:")
                        Text("1. Silly Intro by Alexander Nakaranda")
                        Text("    https://www.chosic.com/download-audio/27131/")
                        Text("2. Humorous And Comic Intro by Free Music")
                        Text("    https://www.chosic.com/download-audio/27133/")
                        Text("3. Cooking by Alex-Productions")
                        Text("    https://www.chosic.com/download-audio/46518/")
                        Text("")
                        Text("Sound effects:")
                        Text("1. Tap")
                        Text("    https://mixkit.co/free-sound-effects/tap/")
                        Text("2. Switch click")
                        Text("    https://mixkit.co/free-sound-effects/click/")
                        Text("3. Correct answer")
                        Text("    https://mixkit.co/free-sound-effects/win/?page=2")
                        Text("4. Wrong answer")
                        Text("    https://mixkit.co/free-sound-effects/wrong/")
                        Text("")
                        Text("Assets:")
                        Text("Designed by Freepik")
                        Text("https://www.freepik.com")
                    }
                    .font(Font(CustomFont.shared.nunitoFontURL(size: 25.0)))
                    .foregroundColor(Colors.purpleText)
                    Spacer()
                }
                .padding()
            }
        }
        .navigationViewStyle(.stack)
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    CreditView()
}
