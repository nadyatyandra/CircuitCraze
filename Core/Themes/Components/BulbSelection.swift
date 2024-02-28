import SwiftUI

struct BulbSelection: View {
    @State var isSelected: Bool
    var value: String
    var onTap: () -> Void
    
    var body: some View {
        Image(isSelected ? "\(value)on" : "\(value)off")
            .resizable()
            .scaledToFit()
            .frame(width: UIScreen.main.bounds.width * 0.155)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(isSelected ? Colors.purpleBg : Colors.purpleText, lineWidth: 4)
                    .cornerRadius(10)
                    .frame(width: UIScreen.main.bounds.width * 0.18, height: UIScreen.main.bounds.width * 0.18)
            )
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Colors.purpleBg, lineWidth: 4)
                    .background(Colors.purpleBg)
                    .opacity(isSelected ? 1.0 : 0)
                    .cornerRadius(10)
                    .frame(width: UIScreen.main.bounds.width * 0.18, height: UIScreen.main.bounds.width * 0.18)
            )
            .padding()
            .onTapGesture {
                isSelected.toggle()
                onTap()
            }
    }
}

#Preview {
    BulbSelection(isSelected: true, value: "1") {}
}
