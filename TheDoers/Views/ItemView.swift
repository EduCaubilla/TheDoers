//
//  ItemView.swift
//  TheDoers
//
//  Created by Edu Caubilla on 4/2/25.
//

import SwiftUI

struct ItemView: View {
    @State var viewModel = ItemViewViewModel()
    let item: ListItem
    
    var body: some View {
        HStack {
            VStack (alignment: .leading) {
                Text(item.title)
                    .font(.title3)
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
                    .foregroundStyle(.secondary)
            }
            
            Spacer()
            
            Button {
                viewModel.toggleIsDone(item: item)
            } label: {
                Image(
                    systemName: item.isDone ?
                    "checkmark.square.fill" : "square"
                )
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 20, height: 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .foregroundStyle(
                    .linearGradient(colors: [.blue,.teal], startPoint: .top, endPoint: .bottom))
            }
        }
    }
}

#Preview {
    ItemView(item: .init(id: "1234", title: "Test Preview", dueDate: Date().timeIntervalSince1970, createdDate: Date().timeIntervalSince1970, isDone: true))
}
