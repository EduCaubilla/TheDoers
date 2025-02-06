//
//  TDButton.swift
//  TheDoers
//
//  Created by Edu Caubilla on 6/2/25.
//

import SwiftUI

struct TDButton: View {
    
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(action: {
            action()
        }, label: {
            Text(title)
                .frame(minWidth: 100, idealWidth: 150, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: 20, idealHeight: 20, maxHeight: 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .padding()
                .foregroundStyle(.white)
                .background(alignment: .center) {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundStyle(
                            .linearGradient(colors: [.blue,.teal], startPoint: .top, endPoint: .bottom))
                }
        })
    }
}

#Preview {
    TDButton(title: "Title"){
        //Trigger action
    }
}
