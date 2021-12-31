//
//  MissionListRow.swift
//  Project8-Moonshot
//
//  Created by Chloe Fermanis on 31/12/21.
//

import SwiftUI

struct MissionListRow: View {
    
    let mission: Mission
    
    var body: some View {
        
        HStack(spacing: 25) {
            Image(mission.image)
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
            
            VStack(alignment: .leading) {
                Text(mission.displayName)
                Text(mission.formattedLaunchDate)
                
            }
        }
        .foregroundColor(.white)
    }
}

struct MissionListRow_Previews: PreviewProvider {
    
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    
    static var previews: some View {
        
        MissionListRow(mission: missions[0])
    }
}
