//
//  LottieView.swift
//  StudyGroupML
//
//  Created by Rakha Fatih Athallah on 07/02/24.
//

import SwiftUI
import Lottie

struct LottieView: UIViewRepresentable {
    
    let filename: String
    let mode: LottieLoopMode
    
    init(filename: String, mode: LottieLoopMode) {
        self.filename = filename
        self.mode = mode
    }
    
    func makeUIView(context: Context) -> LottieAnimationView {
        let view = LottieAnimationView(name: filename)
        view.loopMode = mode
        view.contentMode = .scaleAspectFit
        view.play()
        
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }

}



struct Previews_LottieView_Previews: PreviewProvider {
    static var previews: some View {
        LottieView(filename: "Animation - 1706953226715", mode: .loop)
    }
}
