//
//  NewItemView.swift
//  TheDoers
//
//  Created by Edu Caubilla on 4/2/25.
//

import SwiftUI

struct NewItemView: View {
    
    @StateObject var viewModel = NewItemViewViewModel()
    @Binding var newItemPresented: Bool
    
    var body: some View {
        VStack {
            Text("Add item")
                .font(.system(size: 32, weight: .bold, design: .default))
                .foregroundStyle(
                    .linearGradient(colors: [.blue,.teal], startPoint: .top, endPoint: .bottom))
            Form{
                // Title
                TextField("Title", text: $viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                // Due Date
                DatePicker("Due Date", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                
                // Button
                TDButton(
                    title: "Save"
                ) {
                    if viewModel.canSave {
                        viewModel.save()
                        newItemPresented = false
                    } else {
                        viewModel.showAlert = true
                    }
                }
                .frame(height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .padding(.top, 10)
            }
            .scrollContentBackground(.hidden)
            .alert(isPresented: $viewModel.showAlert) {
                Alert(
                    title: Text( "Error" ),
                    message: Text( "Please fill in all fields and select a correct date" )
                )
            }
        }
        .offset(y:50)
    }
}

#Preview {
    NewItemView(newItemPresented: Binding(get: {
        return true
    }, set: { _ in
        
    }))
}
