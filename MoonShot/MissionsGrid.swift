//
//  MissionsGrid.swift
//  MoonShot
//
//  Created by Neto Lobo on 24/10/23.
//

import SwiftUI

struct MissionsGrid: View {
    let astronauts: [String: Astronaut]
    
    let missions: [Mission]
    
    private let columns = [
        GridItem(.adaptive(minimum: 150))]
    
    var body: some View {
        LazyVGrid(columns: columns) {
            ForEach(missions) { mission in
                NavigationLink {
                    MissionView(mission: mission, astronauts: astronauts)
                } label: {
                    VStack {
                        Image(mission.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200, height: 100)
                        
                        VStack {
                            Text(mission.displayName)
                                .font(.headline)
                                .foregroundColor(.white)
                            
                            Text(mission.formattedLaunchDate)
                                .font(.caption)
                                .foregroundColor(.white.opacity(0.5))
                        }
                        .padding(.vertical)
                        .frame(maxWidth: .infinity)
                        .background(.lightBackground)
                    }
                    .clipShape(Circle())
                    .overlay(
                        Circle()
                            .stroke(.lightBackground)
                    )
                    
                }
            }
        }
        .padding([.horizontal, .bottom])
    }
}

#Preview {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    
    return MissionsGrid(astronauts: astronauts, missions: missions)
        .preferredColorScheme(.dark)
}
