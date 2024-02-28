import SwiftUI

struct CustomFont {
    
    private init() {
        let nunitoFontURL = Bundle.main.url(forResource: "Nunito-SemiBold", withExtension: "ttf")
        
        CTFontManagerRegisterFontsForURL(nunitoFontURL! as CFURL, CTFontManagerScope.process, nil)
    }
    static let shared = CustomFont()
    
    func nunitoFontURL(size: CGFloat) -> UIFont {
        return UIFont(name: "Nunito-SemiBold", size: size)!
    }
}
