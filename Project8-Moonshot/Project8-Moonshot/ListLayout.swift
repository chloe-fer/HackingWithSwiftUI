//
//  ListLayout.swift
//  Project8-Moonshot
//
//  Created by Chloe Fermanis on 31/12/21.
//

import SwiftUI

struct ListLayout: View {
    
    let missions: [Mission]
    let astronauts: [String: Astronaut]
    
    var body: some View {
        
        List {
            ForEach(missions) { mission in
                
                NavigationLink(destination: MissionView(mission: mission, astronauts: astronauts)) {
                    
                    MissionListRow(mission: mission)
                }
            }
        }
        //.background(.darkBackground)
        .foregroundColor(.white)
    }
}

struct ListLayout_Previews: PreviewProvider {
    
    static let missions: [Mission] = Bundle.main.decode("missions.json")
     static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")

    static var previews: some View {
        ListLayout(missions: missions, astronauts: astronauts)
            .preferredColorScheme(.dark)
    }
}
