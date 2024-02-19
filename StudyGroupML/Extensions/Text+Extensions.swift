//
//  TextExtensions.swift
//  StudyGroupML
//
//  Created by Rakha Fatih Athallah on 30/01/24.
//

import SwiftUI

extension Text {
    func fontModifier(size: CGFloat, weight: Font.Weight) -> some View {
        self
            .font(Font.custom("Inter", size: size))
            .fontWeight(weight)
    }
}
