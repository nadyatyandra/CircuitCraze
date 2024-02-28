import SwiftUI

struct PracticeFirstView: View {
    @Environment(\.dismiss) private var dismiss
    
    @State var switch1 = false
    @State var switch2 = false
    @State var switch3 = false
    @State var switch4 = false
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
                        ZStack {
                            Image("practiceQuestion")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: UIScreen.main.bounds.width * 0.95)
                            if switch1 == true {
                                Image("bulbOn")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: UIScreen.main.bounds.width * 0.0425)
                                    .offset(x: UIScreen.main.bounds.width * 0.003, y: -UIScreen.main.bounds.height * 0.11)
                            }
                            if switch2 == true && switch3 == true {
                                Image("bulbOn")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: UIScreen.main.bounds.width * 0.0425)
                                    .offset(x: -UIScreen.main.bounds.width * 0.098, y: -UIScreen.main.bounds.height * 0.035)
                                Image("bulbOn")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: UIScreen.main.bounds.width * 0.0425)
                                    .offset(x: UIScreen.main.bounds.width * 0.098, y: -UIScreen.main.bounds.height * 0.035)
                            }
                            if switch4 == true {
                                Image("bulbOn")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: UIScreen.main.bounds.width * 0.0425)
                                    .offset(x: UIScreen.main.bounds.width * 0.003, y: UIScreen.main.bounds.height * 0.041)
                            }
                        }
                        HStack {
                            SwitchSelection(name: "A", resistor: "3", isParallel: false, isExam: false, isSelected: false) {
                                if switch1 == true {
                                    switch1 = false
                                    MusicPlayer.shared.playSoundEffect(soundEffectFileName: "switchOff", format: "wav", vol: 5)
                                }
                                else {
                                    switch1 = true
                                    MusicPlayer.shared.playSoundEffect(soundEffectFileName: "switchOn", format: "wav", vol: 5)
                                }
                            }
                            SwitchSelection(name: "B", resistor: "4", isParallel: false, isExam: false, isSelected: false) {
                                if switch2 == true {
                                    switch2 = false
                                    MusicPlayer.shared.playSoundEffect(soundEffectFileName: "switchOff", format: "wav", vol: 5)
                                }
                                else {
                                    switch2 = true
                                    MusicPlayer.shared.playSoundEffect(soundEffectFileName: "switchOn", format: "wav", vol: 5)
                                }
                            }
                            SwitchSelection(name: "C", resistor: "2", isParallel: false, isExam: false, isSelected: false) {
                                if switch3 == true {
                                    switch3 = false
                                    MusicPlayer.shared.playSoundEffect(soundEffectFileName: "switchOff", format: "wav", vol: 5)
                                }
                                else {
                                    switch3 = true
                                    MusicPlayer.shared.playSoundEffect(soundEffectFileName: "switchOn", format: "wav", vol: 5)
                                }
                            }
                            SwitchSelection(name: "D", resistor: "2", isParallel: false, isExam: false, isSelected: false) {
                                if switch4 == true {
                                    switch4 = false
                                    MusicPlayer.shared.playSoundEffect(soundEffectFileName: "switchOff", format: "wav", vol: 5)
                                }
                                else {
                                    switch4 = true
                                    MusicPlayer.shared.playSoundEffect(soundEffectFileName: "switchOn", format: "wav", vol: 5)
                                }
                            }
                        }
                        Spacer()
                    }
                    .shake($shake) {}
                    Button(action: {
                        if switch1 == true && switch2 == true && switch3 == true && switch4 == false {
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
                    PracticeTrueView()
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
    PracticeFirstView()
}
