//
//  View+Extensions.swift
//  loginApp
//
//  Created by Henrique Delgado on 06/12/24.
//

import SwiftUI

extension View {

    @ViewBuilder
    func hAlign(_ alignment: Alignment) -> some View {
        self
            .frame(maxWidth: .infinity, alignment: alignment)
    }

    @ViewBuilder
    func vAlign(_ alignment: Alignment) -> some View {
        self
            .frame(maxHeight: .infinity, alignment: alignment)
    }

    @ViewBuilder
    func disableOpacitu(_ condition: Bool) -> some View {
        self.disabled(condition)
            .opacity(condition ? 0.5 : 1)
    }
}
