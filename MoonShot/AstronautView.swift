//
//  AstronautView.swift
//  MoonShot
//
//  Created by Neto Lobo on 23/10/23.
//

import SwiftUI

struct AstronautView: View {
    let astronaut: Astronaut
    var body: some View {
        ScrollView {
            VStack {
                Image(astronaut.id)
                    .resizable()
                    .scaledToFit()
                
                Text(astronaut.description)
                    .padding()
            }
        }
        .background(.darkBackground)
        .navigationTitle(astronaut.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    let astronaut: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    return AstronautView(astronaut: astronaut["armstrong"]!)
        .preferredColorScheme(.dark)
}

