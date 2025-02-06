//
//  HeaderView.swift
//  TheDoers
//
//  Created by Edu Caubilla on 4/2/25.
//

import SwiftUI

struct HeaderView: View {
    
    let title: String
    let subtitle: String
    let angle: Double
    let background: Color
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 0)
//                .foregroundStyle(background)
                .foregroundStyle(.linearGradient(colors: [.blue,.teal], startPoint: .top, endPoint: .bottom))
                .rotationEffect(Angle(degrees: angle))
            
            VStack{
                Text(title)
                    .font(.system(size: 50))
                    .foregroundStyle(.white)
                    .bold()
                Text(subtitle)
                    .font(.system(size: 30))
                    .foregroundStyle(.white)
                    .fontWeight(.light)
            }
            .padding(.top, 50)
        }
        .frame(width: UIScreen.main.bounds.width * 3,
               height: 300)
        .offset(y: -100)
    }
}

#Preview {
    HeaderView(title:"Title",
               subtitle: "Subtitle",
               angle: -10,
               background: .teal)
}
