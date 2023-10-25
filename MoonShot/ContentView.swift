//
//  ContentView.swift
//  MoonShot
//
//  Created by Neto Lobo on 20/10/23.
//

import SwiftUI

struct ContentView: View {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    @State private var showingGrid = true
    
    
    var body: some View {
        NavigationView {
            ScrollView {
                if showingGrid {
                    MissionsGrid(astronauts: astronauts, missions: missions)
                } else {
                    MissionsList(astronauts: astronauts, missions: missions)
                }
            }
            .navigationTitle("Moonshot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
            .toolbar{
                Button {
                    withAnimation {
                        showingGrid.toggle()
                    }
                } label: {
                    Image(systemName: showingGrid ? "list.bullet" : "circle.grid.2x2")
                        .foregroundColor(.white)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
