//
//  MissionView.swift
//  MoonShot
//
//  Created by Neto Lobo on 23/10/23.
//

import SwiftUI

struct MissionView: View {

    let mission: Mission
    let crew: [CrewMember]
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack {
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: geometry.size.width * 0.6)
                    
                    Text(mission.formattedLaunchDateForMissionDetail)
                        .font(.headline)
                        .foregroundColor(.white.opacity(0.5))
                    
                    VStack(alignment: .leading) {
                        NiceSeparator()
                        
                        Text("Mission Highlights")
                            .font(.title.bold())
                            .padding(.bottom, 5)
                        
                        Text(mission.description)
                        
                        NiceSeparator()
                        
                        Text("Crew")
                            .font(.title.bold())
                            .padding(.bottom, 5)
                        
                        
                    }
                    .padding(.horizontal)
                    
                    CrewPanel(crew: crew)
                }
                .padding(.bottom)
            }
        }
        .navigationTitle(mission.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
    }
    
    init(mission: Mission, astronauts: [String: Astronaut]) {
        self.mission = mission
        self.crew = mission.crew.map { member in
            if let astronaut = astronauts[member.name] {
                return CrewMember(role: member.role, astronaut: astronaut)
            } else {
                fatalError("Mission \(member.name)")
            }
        }
    }
}

#Preview {
    let missions: [Mission] = Bundle.main.decode("missions.json")
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    return MissionView(mission: missions[0], astronauts: astronauts)
        .preferredColorScheme(.dark)
}
