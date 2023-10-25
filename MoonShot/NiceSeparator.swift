//
//  NiceSeparator.swift
//  MoonShot
//
//  Created by Neto Lobo on 24/10/23.
//

import SwiftUI

struct NiceSeparator: View {
    var body: some View {
        Rectangle()
            .frame(height: 2)
            .foregroundColor(.lightBackground)
            .padding(.vertical)
    }
}

#Preview {
    NiceSeparator()
}
