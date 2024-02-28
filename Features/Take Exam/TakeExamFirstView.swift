import SwiftUI

struct TakeExamFirstView: View {
    @Environment(\.dismiss) private var dismiss
    
    @State var switch1 = false
    @State var switch2 = false
    @State var switch3 = false
    @State var switch4 = false
    @State var switch5 = false
    @State var switch6 = false
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
                            Image("examQuestion")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: UIScreen.main.bounds.width * 0.95)
                            if switch1 == true && switch3 == true {
                                Image("bulbOn")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: UIScreen.main.bounds.width * 0.0425)
                                    .offset(x: -UIScreen.main.bounds.width * 0.0667, y: -UIScreen.main.bounds.height * 0.187)
                                Image("bulbOn")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: UIScreen.main.bounds.width * 0.0425)
                                    .offset(x: UIScreen.main.bounds.width * 0.2, y: -UIScreen.main.bounds.height * 0.155)
                            }
                            if switch2 == true && switch3 == true {
                                Image("bulbOn")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: UIScreen.main.bounds.width * 0.0425)
                                    .offset(x: -UIScreen.main.bounds.width * 0.0667, y: -UIScreen.main.bounds.height * 0.117)
                                Image("bulbOn")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: UIScreen.main.bounds.width * 0.0425)
                                    .offset(x: UIScreen.main.bounds.width * 0.2, y: -UIScreen.main.bounds.height * 0.155)
                            }
                            if switch4 == true {
                                Image("bulbOn")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: UIScreen.main.bounds.width * 0.04)
                                    .offset(x: UIScreen.main.bounds.width * 0.0005, y: -UIScreen.main.bounds.height * 0.0475)
                            }
                            if switch5 == true {
                                Image("bulbOn")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: UIScreen.main.bounds.width * 0.04)
                                    .offset(x: UIScreen.main.bounds.width * 0.0005, y: UIScreen.main.bounds.height * 0.0235)
                            }
                            if switch6 == true {
                                Image("bulbOn")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: UIScreen.main.bounds.width * 0.04)
                                    .offset(x: UIScreen.main.bounds.width * 0.0005, y: UIScreen.main.bounds.height * 0.0945)
                            }
                        }
                        HStack {
                            SwitchSelection(name: "A", resistor: "3", isParallel: false, isExam: true, isSelected: false) {
                                if switch1 == true {
                                    switch1 = false
                                    MusicPlayer.shared.playSoundEffect(soundEffectFileName: "switchOff", format: "wav", vol: 5)
                                }
                                else {
                                    switch1 = true
                                    MusicPlayer.shared.playSoundEffect(soundEffectFileName: "switchOn", format: "wav", vol: 5)
                                }
                            }
                            SwitchSelection(name: "B", resistor: "4", isParallel: false, isExam: true, isSelected: false) {
                                if switch2 == true {
                                    switch2 = false
                                    MusicPlayer.shared.playSoundEffect(soundEffectFileName: "switchOff", format: "wav", vol: 5)
                                }
                                else {
                                    switch2 = true
                                    MusicPlayer.shared.playSoundEffect(soundEffectFileName: "switchOn", format: "wav", vol: 5)
                                }
                            }
                            SwitchSelection(name: "C", resistor: "2", isParallel: false, isExam: true, isSelected: false) {
                                if switch3 == true {
                                    switch3 = false
                                    MusicPlayer.shared.playSoundEffect(soundEffectFileName: "switchOff", format: "wav", vol: 5)
                                }
                                else {
                                    switch3 = true
                                    MusicPlayer.shared.playSoundEffect(soundEffectFileName: "switchOn", format: "wav", vol: 5)
                                }
                            }
//                        }
//                        HStack {
                            SwitchSelection(name: "D", resistor: "3", isParallel: false, isExam: true, isSelected: false) {
                                if switch4 == true {
                                    switch4 = false
                                    MusicPlayer.shared.playSoundEffect(soundEffectFileName: "switchOff", format: "wav", vol: 5)
                                }
                                else {
                                    switch4 = true
                                    MusicPlayer.shared.playSoundEffect(soundEffectFileName: "switchOn", format: "wav", vol: 5)
                                }
                            }
                            SwitchSelection(name: "E", resistor: "4", isParallel: false, isExam: true, isSelected: false) {
                                if switch5 == true {
                                    switch5 = false
                                    MusicPlayer.shared.playSoundEffect(soundEffectFileName: "switchOff", format: "wav", vol: 5)
                                }
                                else {
                                    switch5 = true
                                    MusicPlayer.shared.playSoundEffect(soundEffectFileName: "switchOn", format: "wav", vol: 5)
                                }
                            }
                            SwitchSelection(name: "F", resistor: "2", isParallel: false, isExam: true, isSelected: false) {
                                if switch6 == true {
                                    switch6 = false
                                    MusicPlayer.shared.playSoundEffect(soundEffectFileName: "switchOff", format: "wav", vol: 5)
                                }
                                else {
                                    switch6 = true
                                    MusicPlayer.shared.playSoundEffect(soundEffectFileName: "switchOn", format: "wav", vol: 5)
                                }
                            }
                        }
                        Spacer()
                    }
                    .shake($shake) {}
                    Button(action: {
                        if switch1 == true && switch2 == false && switch3 == true && switch4 == true && switch5 == false && switch6 == true {
                            MusicPlayer.shared.playSoundEffect(soundEffectFileName: "correct", format: "wav", vol: 1)
                            withAnimation(.easeIn(duration: 0.75)) {
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
                    TakeExamTrueView()
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
    TakeExamFirstView()
}
