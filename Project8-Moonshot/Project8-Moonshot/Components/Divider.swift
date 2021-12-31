//
//  Divider.swift
//  Project8-Moonshot
//
//  Created by Chloe Fermanis on 31/12/21.
//

import SwiftUI

struct Divider: View {
    
    var body: some View {
        
        VStack {
            
            Rectangle()
                .frame(height: 2)
                .foregroundColor(.lightBackground)
            .padding(.vertical)
        }
    }
    
}

struct Divider_Previews: PreviewProvider {
    static var previews: some View {
        Divider()
    }
}
