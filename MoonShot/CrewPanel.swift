//
//  CrewPanel.swift
//  MoonShot
//
//  Created by Neto Lobo on 24/10/23.
//

import SwiftUI

struct CrewPanel: View {
    let crew: [CrewMember]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(crew, id: \.role) { crewMember in
                    NavigationLink {
                        AstronautView(astronaut: crewMember.astronaut)
                    } label: {
                        HStack {
                            Image(crewMember.astronaut.id)
                                .resizable()
                                .frame(width: 104, height: 72)
                                .clipShape(Capsule())
                                .overlay(
                                    Capsule()
                                        .strokeBorder(.white, lineWidth: 1)
                                )
                               
                            VStack(alignment: .leading) {
                                Text(crewMember.astronaut.name)
                                    .foregroundColor(.white)
                                    .font(.headline)
                                
                                Text(crewMember.role)
                                    .foregroundColor(.secondary)
                            }
                        }
                        .padding(.horizontal)
                    }
                }
            }
        }
    }
}

#Preview {
    let astronaut: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    let crewMember = CrewMember(role: "Commander", astronaut: astronaut["armstrong"]!)
    
    return CrewPanel(crew: [crewMember])
        .preferredColorScheme(.dark)
}
