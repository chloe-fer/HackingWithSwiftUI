//
//  CrewMemberView.swift
//  Project8-Moonshot
//
//  Created by Chloe Fermanis on 31/12/21.
//

import SwiftUI

struct CrewMemberView: View {
    
    let crewMember: CrewMember
    
    var body: some View {
        
        HStack {
            
            Image(crewMember.astronaunt.id)
                .resizable()
                .frame(width: 104, height: 72)
                .clipShape(Capsule())
                .overlay(
                    Capsule()
                        .strokeBorder(.white, lineWidth: 1)
                )
            
        
            VStack(alignment: .leading) {
                
                Text(crewMember.astronaunt.name)
                    .foregroundColor(.white)
                    .font(.headline)
                
                Text(crewMember.role)
                    .foregroundColor(.secondary)
            }
        }
        .padding(.horizontal)
        
    }
}

struct CrewMemberView_Previews: PreviewProvider {
    

    static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")

    
    static var previews: some View {
        CrewMemberView(crewMember: CrewMember(role: "Hero!", astronaunt: astronauts["armstrong"]!))
            .preferredColorScheme(.dark)

    }
}
