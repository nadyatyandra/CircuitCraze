import SwiftUI

struct Shake<Content: View>: View {
    @Binding var shake: Bool
    
    var repeatCount = 3
    var duration = 0.8
    var offsetRange = 10.0
    
    @ViewBuilder let content: Content
    var onCompletion: (() -> Void)?
    
    @State private var xOffset = 0.0
    
    var body: some View {
        content
            .offset(x: xOffset)
            .onChange(of: shake) { shouldShake in
                guard shouldShake else { return }
                Task {
                    await animate()
                    shake = false
                    onCompletion?()
                }
            }
    }
    
    private func animate() async {
        let factor1 = 0.9
        let eachDuration = duration * factor1 / CGFloat(repeatCount)
        for _ in 0..<repeatCount {
            await backAndForthAnimation(duration: eachDuration, offset: offsetRange)
        }
        
        let factor2 = 0.1
        await animate(duration: duration * factor2) {
            xOffset = 0.0
        }
    }
    
    private func backAndForthAnimation(duration: CGFloat, offset: CGFloat) async {
        let halfDuration = duration / 2
        await animate(duration: halfDuration) {
            self.xOffset = offset
        }
        
        await animate(duration: halfDuration) {
            self.xOffset = -offset
        }
    }
}
