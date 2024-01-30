//
//  ViewExtensions.swift
//  StudyGroupML
//
//  Created by Rakha Fatih Athallah on 30/01/24.
//

import SwiftUI

extension Text {
    func fontModifier(size: CGFloat) -> some View {
        self
            .font(Font.custom("Inter", size: size))
    }
}
