//
//  AddressView.swift
//  Project10-CupcakeCorner
//
//  Created by Chloe Fermanis on 8/1/22.
//

import SwiftUI

struct AddressView: View {
    
    @ObservedObject var order: Order
    
    var body: some View {
        
        Form {
            
            Section {
                
                TextField("Name", text: $order.name)
                
                TextField("Street address", text: $order.streetAdress)
                
                TextField("City", text: $order.city)
                
                TextField("Zip", text: $order.zip)
            }
            
            Section {
                
                NavigationLink {
                    CheckoutView(order: order)
                } label: {
                    Text("Check out")
                }
            }
            .disabled(!order.hasValidAddress)
        }
        .navigationTitle("Delivery Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AddressView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddressView(order: Order())
        }
    }
}
