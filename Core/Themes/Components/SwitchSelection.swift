import SwiftUI

struct SwitchSelection: View {
    let name: String
    let resistor: String
    var isParallel: Bool
    var isExam: Bool
    @State var isSelected: Bool
    var onTap: () -> Void
    
    var body: some View {
        VStack {
            Image(isSelected ? "switchOn" : "switchOff")
                .resizable()
                .scaledToFit()
                .frame(width: UIScreen.main.bounds.width * (isExam ?  0.115 : 0.155))
                .padding()
                .onTapGesture {
                    isSelected.toggle()
                    onTap()
                }
            Text("Bulb \(name)")
                .font(Font(CustomFont.shared.nunitoFontURL(size: 20.0)))
                .foregroundColor(Color.white)
            if isParallel {
                Text("\(resistor) Ω")
                    .font(Font(CustomFont.shared.nunitoFontURL(size: 20.0)))
                    .foregroundColor(Color.white)
            }
        }
    }
}
