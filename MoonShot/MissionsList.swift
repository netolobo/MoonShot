//
//  MissionsList.swift
//  MoonShot
//
//  Created by Neto Lobo on 24/10/23.
//

import SwiftUI

struct MissionsList: View {
    let astronauts: [String: Astronaut]
    
    let missions: [Mission]
    
    var body: some View {
        LazyVStack {
            ForEach(missions) { mission in
                NavigationLink {
                    MissionView(mission: mission, astronauts: astronauts)
                } label: {
                    HStack {
                        Image(mission.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 70, height: 70)
                        
                        VStack {
                            Text("Mission \(mission.displayName)")
                                .font(.headline)
                                .foregroundColor(.white)
                            
                            Text(mission.formattedLaunchDateForMissionDetail)
                                .font(.caption)
                                .foregroundColor(.white.opacity(0.5))
                        }
                        .padding(.vertical)
                        .frame(maxWidth: .infinity)
                        .background(.lightBackground)
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .overlay(RoundedRectangle(cornerRadius: 20)
                        .stroke(.lightBackground))
                }
            }
        }
    }
}

#Preview {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    return MissionsList(astronauts: astronauts, missions: missions)
        .preferredColorScheme(.dark)
}
